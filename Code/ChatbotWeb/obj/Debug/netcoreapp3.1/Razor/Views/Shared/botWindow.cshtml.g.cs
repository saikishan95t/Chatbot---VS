#pragma checksum "E:\Masters\Capstone\Chatbot - VS\Code\ChatbotWeb\Views\Shared\botWindow.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "396912a7dedbf74b98dcf2ae8083a31682761350"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared_botWindow), @"mvc.1.0.view", @"/Views/Shared/botWindow.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "E:\Masters\Capstone\Chatbot - VS\Code\ChatbotWeb\Views\_ViewImports.cshtml"
using ChabotWeb;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "E:\Masters\Capstone\Chatbot - VS\Code\ChatbotWeb\Views\_ViewImports.cshtml"
using ChabotWeb.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"396912a7dedbf74b98dcf2ae8083a31682761350", @"/Views/Shared/botWindow.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"205924299bd1d19ad94d89e58d3167737e1b6deb", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared_botWindow : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("iPPiLogo"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/logo-icon.PNG"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 4 "E:\Masters\Capstone\Chatbot - VS\Code\ChatbotWeb\Views\Shared\botWindow.cshtml"
  
    ViewData["Title"] = "botWindow";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div id=""botNotification"" ng-if=""requestDone"" ng-click=""toggleChatWindow()"">
    You have a new message. Click Here!!
</div>
<div id=""botClosed"" ng-if=""chatClosed"" ng-click=""toggleChatWindow()"">
    <i class=""fas fa-robot""></i>
</div>
<div id=""chatWindow"" ng-if=""!chatClosed"">
    <div id=""chatbotTitle"">
        <div id=""botLogoText"">
            <div id=""botLogo"">
                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "396912a7dedbf74b98dcf2ae8083a316827613504422", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
            </div>
            <div id=""iPPiBotText"">iPPi Bot</div>
        </div>
        <div id=""closeWindow"" ng-click=""closeWindow()""><i class=""fas fa-times""></i></div>
    </div>
    <div id=""convoBox"" ng-init=""firstConv()"">
        <div ng-repeat=""convo in conversation track by $index"">
            <div ng-if=""$even"" class=""botMessage"">
                <div class=""question"">
                    <div ng-init=""scrollDown()"" ng-if=""convo.Answers[0].AnswerType == 'TEXT' || convo.Answers[0].AnswerType == 'NONE'"">
                        {{convo.Question}}
                    </div>
                    <div ng-if=""convo.Answers[0].AnswerType == 'RADIO_BUTTON'"">
                        <div id=""questionLabel"">{{convo.Question}}</div>
                        <label ng-repeat=""option in convo.Answers"">
                            <input type=""radio"" ng-click=""selectRadio()"" ng-init=""scrollDown()"" ng-model=""input.Radio"" ng-value=""option.Answer"" /> {{option.Answer}}
                        </labe");
            WriteLiteral(@"l>
                    </div>
                    <div ng-if=""convo.Answers[0].AnswerType == 'DROPDOWN'"">
                        <div id=""questionLabel"">{{convo.Question}}</div>
                        <div>
                            <select class=""selectBox"" ng-model=""input.dropdown"" ng-init=""scrollDown()"" ng-options=""option.Answer for option in convo.Answers"" ng-change=""selectDropdown()"">
                            </select>
                        </div>
                    </div>
                    <div ng-if=""convo.Answers[0].AnswerType == 'MULTI_SELECT'"">
                        <div id=""questionLabel"">{{convo.Question}}</div>
                        <label ng-repeat=""option in convo.Answers"">
                            <input type=""checkbox"" ng-init=""scrollDown()"" ng-click=""selectCheckbox(convo,$index)"" ng-model=""input.checkbox[$index]"" ng-value=""option.Answer"" /> {{option.Answer}}
                        </label>
                    </div>
                    <div ng-if=""convo.Ans");
            WriteLiteral(@"wers[0].AnswerType == 'NUMBER'"">
                        <div id=""questionLabel"">{{convo.Question}}</div>
                        <input type=""number"" ng-click=""selectNumber()"" ng-keydown=""selectNumber()"" ng-keyup=""$event.keyCode == 13 && submitInput()"" ng-init=""scrollDown()"" ng-model=""input.Number"" />
                    </div>
                    <div ng-if=""convo.Answers[0].AnswerType == 'DATE'"">
                        <div id=""questionLabel"">{{convo.Question}}</div>
                        <input type=""datetime-local"" ng-click=""selectDate()"" ng-init=""scrollDown()"" ng-model=""input.Date"" />
                    </div>
                </div>
            </div>
            <div ng-if=""$odd"" ng-init=""scrollDown()"" class=""userMessage""><div class=""response"">{{convo.Question}}</div></div>
        </div>
    </div>
    <div id=""botInput"">
        <input id=""userInput"" type=""text"" ng-model=""input.Text"" ng-keydown=""$event.keyCode == 13 && submitInput()"" placeholder=""Your text here..."" />
        <div ");
            WriteLiteral("id=\"submitBtn\" ng-click=\"submitInput()\"><i class=\"fas fa-arrow-right\"></i></div>\r\n    </div>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
