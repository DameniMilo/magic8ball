package org.jahia.modules.magic8ball;

import org.jahia.bin.Action;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.bin.ActionResult;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.json.JSONObject;

import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Map;
import java.util.List;
import java.util.Random;

public class Answer extends Action{
	
	public ActionResult doExecute(HttpServletRequest req, RenderContext renderContext, Resource resource,
            JCRSessionWrapper session, Map<String, List<String>> parameters, URLResolver urlResolver) throws Exception {
		
		String question = req.getParameter("question");
		
		JCRNodeWrapper magic8ballNode = session.getNodeByUUID(renderContext.getMainResource().getNode().getIdentifier());
		JCRNodeWrapper answers = magic8ballNode.getNode("answers");
		
		NodeIterator answersList = answers.getNodes();
		
		Random random = new Random();
		long randomValue = (long)(random.nextInt((int)(answersList.getSize())) + 1); //get random value for the answer
		
		JSONObject jsonAnswer = new JSONObject();
		Node answer = answersList.nextNode();
		
		while(answersList.getPosition() != randomValue){
			answer = answersList.nextNode();
		}
		
		jsonAnswer.append("qestion", question);
		jsonAnswer.append("answerLabel", answer.getProperty("label").getString());
		jsonAnswer.append("answerType", answer.getProperty("type").getString());
		
		return new ActionResult(HttpServletResponse.SC_OK, null, jsonAnswer);
	}
}