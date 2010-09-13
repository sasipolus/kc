<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<c:set var="dateRangeFilterAttributes" value="${DataDictionary.DateRangeFilter.attributes}" />
${kfunc:registerEditableProperty(KualiForm, "actionHelper.selectedHistoryItem")}

<kul:innerTab tabTitle="History" parentTab="" defaultOpen="false">

    <div class="innerTab-container" align="left">
        <table class="tab" cellpadding="0" cellspacing="0" summary=""> 
            <tbody>
            <tr>
                <th class="infoline"><nobr>&nbsp;&nbsp;&nbsp;&nbsp;View Action Date Range:</nobr></th>
                <td class="infoline"> 
                    <nobr>&nbsp;Beginning On&nbsp;
                       <kul:htmlControlAttribute property="actionHelper.historyDateRangeFilter.beginningOn" attributeEntry="${dateRangeFilterAttributes.beginningOn}"  />
                	   &nbsp;
                	</nobr>
                </td>
                <td class="infoline"> 
                    <nobr>&nbsp;Ending On&nbsp;
                       <kul:htmlControlAttribute property="actionHelper.historyDateRangeFilter.endingOn" attributeEntry="${dateRangeFilterAttributes.endingOn}"  />
                		&nbsp;
                	</nobr>
                </td>
                <td class="infoline" style="width:90%;text-align:left;">&nbsp;
                    <html:image property="methodToCall.filterHistory.line${ctr}.anchor${currentTabIndex}"
                                src='${ConfigProperties.kra.externalizable.images.url}tinybutton-filter.gif' 
                                styleClass="tinybutton"/>                         
                </td>
            </tr>
            </tbody>
        </table>
        
        <table id="historyTable" class="tab" cellpadding="0" cellspacing="0" summary="">
            <tbody>
                <tr>
	                <td class="infoline">&nbsp;</td>
	                <th>Description</th>
	                <th>Date</th>
	                <th><nobr>Action Date</nobr></th>
	                <th style="width:50%;">Comments</th>
                </tr>
                <c:forEach items="${KualiForm.actionHelper.filteredProtocolActions}" var="protocolAction" varStatus="status">
                    
            		<tr>
            		    <td class="infoline" style="text-align:center;">
            		        <c:choose>
            		            <c:when test="${protocolAction.submissionNumber == null}">
            		                &nbsp;
            		            </c:when>
            		            <c:otherwise>
            		                <input name="actionHelper.selectedHistoryItem" type="radio" class="nobord" value="${protocolAction.protocolActionId}">
            		            </c:otherwise>
            		        </c:choose>
            		    </td>
            		    <td class="infoline">
            		        <nobr><b>${protocolAction.protocolActionType.description}</b></nobr>
            		    </th>
            		    <td class="infoline">
            		        <nobr>${protocolAction.actualActionDateString}</nobr>
            		    </td>
            		    <td class="infoline">
            		        <nobr>${protocolAction.actionDateString}</nobr>
            		    </td>
            		    <td class="infoline">
            		        <c:choose>
            		            <c:when test="${fn:length(protocolAction.comments) > 0}">
                                    <kra:truncateComment textAreaFieldName="actionHelper.filteredProtocolActions[${status.index}].comments" 
                                                         action="protocolProtocolActions" 
                                                         textAreaLabel="Action Comment" 
                                                         textValue="${protocolAction.comments}" 
                                                         displaySize="100"/>
                                </c:when>
                                <c:otherwise>
                                      &nbsp;
                                </c:otherwise>
                            </c:choose>
                        </td>
            		</tr>
            		
            		<c:if test="${fn:length(protocolAction.protocolCorrespondences) > 0}">
            			<tr>
            				<td class="infoline">&nbsp;</td>
            		        <td colspan="4">
            		        	<kul:innerTab tabTitle="Attachments" tabItemCount="${fn:length(protocolAction.protocolCorrespondences)}" parentTab="attachment${status.index}" defaultOpen="false" tabErrorKey="">
            		        		<div class="innerTab-container" align="left">
                                
                                    <table class="tab" cellpadding="0" cellspacing="0" summary="">
                                        <tbody>
                                            <tr>
                                               <th style="text-align:left;width:10%">File Name</th>
                                               <th style="text-align:left">Description</th>
                                            </tr>
           		                            <c:forEach items="${protocolAction.protocolCorrespondences}" var="correspondence" varStatus="actionStatus">
           		    	                        <tr>
           		    	                            <td>${correspondence.protocolCorrespondenceType.description}</td>
           		    	                            <%--Leaving this here in case there is a need to display additional information. --%>
           		    	                            <%--
           		    	                            <td>
           		    	                                <c:choose>
           		                                            <c:when test="${fn:length(correspondence.protocolCorrespondenceType.description) > 0}">
                                                                   
                                                                   <kra:truncateComment textAreaFieldName="document.protocolList[0].protocolActions[${status.index}].protocolCorrespondences[${actionStatus.index}].protocolCorrespondenceType.description" 
                                                                                        action="protocolProtocolActions" 
                                                                                        textAreaLabel="Attachment Description" 
                                                                                        textValue="${correspondence.protocolCorrespondenceType.description}" 
                                                                                        displaySize="250"/>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  &nbsp;
                                                              </c:otherwise>
                                                          </c:choose>
                                                      </td>
                                                       --%>
           		    	                        </tr>
           		                            </c:forEach>
            		                    </tbody>
            		                </table>
            		            </div>
            		        	</kul:innerTab>
            		        </td>            		        
            			</tr>
            		</c:if>
            		
            	</c:forEach>
            	
            	<tr>
            	    <td class="infoline" colspan="5">
            	        <html:image property="methodToCall.loadProtocolSummary.line${ctr}.anchor${currentTabIndex}"
                                    src='${ConfigProperties.kra.externalizable.images.url}tinybutton-load.gif' 
                                    styleClass="tinybutton" style="vertical-align:bottom"/>  
            	        Load selected node into Summary View, above
            	    </td>
            	</tr>
            </tbody>
        </table>
    </div>
    			
</kul:innerTab>