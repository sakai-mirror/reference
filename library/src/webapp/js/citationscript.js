/**********************************************************************************
 * $URL: https://source.sakaiproject.org/svn/access/trunk/access-impl/impl/src/java/org/sakaiproject/access/tool/AccessServlet.java $
 * $Id: AccessServlet.java 7534 2006-04-09 17:09:10Z ggolden@umich.edu $
 ***********************************************************************************
 *
 * Copyright (c) 2003, 2004, 2005, 2006 The Sakai Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at
 * 
 *      http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License.
 *
 **********************************************************************************/

var popup = null;

function buildForm(form_str)
{
	var scratch_div = document.getElementById("scratch_space");
	scratch_div.innerHTML = form_str;
}
function closePopup()
{
	if(window.opener)
	{
		window.opener.closeWindow();
	}
}
function closePopupAndSubmitFormFromParent(form_id)
{
	var form_obj = document.getElementById(form_id);
	var form_str = "<form name=\"" + form_id + "\" id=\"" + form_id + "\" method=\"post\" action=\"" + form_obj.action + "\">\n";
	for(var i = 0; i < form_obj.elements.length; i++)
	{
		if(form_obj.elements[i].value && form_obj.elements[i].type != "button" && form_obj.elements[i].type != "cancel" && form_obj.elements[i].type != "submit")
		{
			form_str += "<input type=\"hidden\" name=\"" + form_obj.elements[i].name + "\" value=\"" + form_obj.elements[i].value + "\" />\n";
		}
	}
	form_str += "</form>\n";
	alert("form_str = " + form_str);
	window.opener.buildForm(form_str);
	window.opener.submitFormAndClosePopup(form_id, window);
}
function closeWindow()
{
	if(popup)
	{
		popup.close();
	}
}
function createCitation(form_id)
{
	var form_obj = document.getElementById(form_id);
	var form_str = "<form name=\"" + form_id + "\" id=\"" + form_id + "\" method=\"post\" action=\"" + form_obj.action + "\">\n";
	for(var i = 0; i < form_obj.elements.length; i++)
	{
		if(form_obj.elements[i].value && form_obj.elements[i].type != "button" && form_obj.elements[i].type != "cancel" && form_obj.elements[i].type != "submit")
		{
			form_str += "<input type=\"hidden\" name=\"" + form_obj.elements[i].name + "\" value=\"" + form_obj.elements[i].value + "\" />\n";
		}
	}
	form_str += "</form>\n";
	window.opener.buildForm(form_str);
	window.opener.submitFormAndClosePopup(form_id, window);
}
function openWindow(url, title, height) 
{ 
	var params = "scrollbars=no,menubar=no,height=" + height + ",width=800,toolbar=no,location=no,status=no";
	popup = window.open(url,title,params);
	popup.focus();
	return false;
}
function setPopupHeight(id)
{
	var frame = window.opener.popup;
	
	if (frame)
	{
		// reset the scroll
		frame.window.scrollTo(0,0);

		var height; 
		
		var scrollH = document.body.scrollHeight;
		var offsetH = document.body.offsetHeight;
		var clientH = document.body.clientHeight;
		var innerDocScrollH = null;

		if (typeof(frame.contentDocument) != 'undefined' || typeof(frame.contentWindow) != 'undefined')
		{
			// very special way to get the height from IE on Windows!
			// note that the above special way of testing for undefined variables is necessary for older browsers
			// (IE 5.5 Mac) to not choke on the undefined variables.
 			var innerDoc = (frame.contentDocument) ? frame.contentDocument : frame.contentWindow.document;
			innerDocScrollH = (innerDoc != null) ? innerDoc.body.scrollHeight : null;
		}

		if (document.all && innerDocScrollH != null)
		{
			// IE on Windows only
			height = innerDocScrollH;
		}
		else
		{
			// every other browser!
			height = offsetH;
		}

		// here we fudge to get a little bigger
		var newHeight = height + 100;
		if(newHeight > 1000)
		{
			newHeight = 1000;
		}
		frame.resizeTo(800, newHeight);
	}

}
function submitform(id)
{
	var theForm = document.getElementById(id);
	if(theForm && theForm.onsubmit)
	{
		theForm.onsubmit();
	}
	if(theForm && theForm.submit)
	{
		theForm.submit();
	}
}
function submitFormAndClosePopup(form_id, popup)
{
	popup.close();
	var form_obj = document.getElementById(form_id);
	form_obj.submit();
}
