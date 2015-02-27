# ###############
# # Hooks
# ###############
# require 'page-object'
# require 'page-object/page_factory'
#
# if ENV['IN_BROWSER']
#   # browser = Watir::Browser.new 'firefox'
#   browser = Selenium::WebDriver.for :firefox
# else
#   # browser = Watir::Browser.new :phantomjs
#   # browser = Selenium::WebDriver.for :phantomjs
#     require 'capybara/poltergeist'
#     Capybara.register_driver :poltergeist do |app|
#         browser = Capybara::Poltergeist::Driver.new(app, :js_errors => false, :timeout => $maxWaitTime, :phantomjs_options => ['--ignore-ssl-errors=yes'])
#     end
#     Capybara.javascript_driver = Capybara.default_driver = :poltergeist
# end
#
# Before do
#   @browser = browser
# end
#
# Before do |scenario|
#     $webserviceUrl = "#{$webserviceHost}/webservices/RequestFrameworkTestLabs?wsdl"
#
#     #hashes to store data used between steps.  clears them before each scenario.
#     @global        = {}
#     @poHash        = {}
#     @poMap         = {}
#
#     case ENV['ICIX_ENV']
#         when 'development'
#             step 'the buyerOrgId is 31622'
#             @global['buyerGUIUser']      = 'direct51T'
#             @global['buyerGUIPassword']  = 'direct51T'
#             @global['buyerSftpUser']     = 'test_qa2'
#             @global['buyerSftpPassword'] = 'Join*Clock332'
#
#         when 'integration'
#             #for buyer orgid 31622. used for most tests
#             step 'the buyerOrgId is 31622'
#             @global['buyerGUIUser']      = 'direct51T'
#             @global['buyerGUIPassword']  = 'direct51T'
#             @global['buyerSftpUser']     = 'test_qa2'
#             @global['buyerSftpPassword'] = 'Join*Clock332'
#             @global['supplier'] = 'QA_SupplierDemo'
#             @global['supplierId'] = '12345678'
#             @global['supplierOrgId'] = '151456'
#
#         when 'stage'
#             #for buyer orgid 31622. used for most tests
#             step 'the buyerOrgId is 31622'
#             @global['buyerGUIUser']      = 'direct51T'
#             @global['buyerGUIPassword']  = 'direct51T'
#             @global['buyerSftpUser']     = 'test_qa2'
#             @global['buyerSftpPassword'] = 'Join*Clock332'
#             @global['supplier'] = 'supplier0015917'
#             @global['supplierId'] = 'sid 001591'
#             @global['supplierOrgId'] = '341244'
#
#         when 'uat-directTest'
#             step 'the buyerOrgId is 153888'
#             @global['buyerGUIUser']      = 'dtv2buyer1'
#             @global['buyerGUIPassword']  = 'dtv2buyer1'
#             @global['buyerSftpUser']     = 'dtv2buyer1'
#             @global['buyerSftpPassword'] = 'pal@Bulb56'
#             @global['supplier'] = 'QA_SupplierDemo'
#             @global['supplierId'] = '12345678'
#             @global['supplierOrgId'] = '153789'
#
#         when 'demo'
#             step 'the buyerOrgId is 149838'
#             @global['buyerGUIUser']      = 'dtdemobuyer'
#             @global['buyerGUIPassword']  = 'dtdemobuyer'
#             @global['buyerSftpUser']     = 'dtv2productionbuyer'
#             @global['buyerSftpPassword'] = 'Hello^ZWorld'
#             @global['supplier'] = 'QA_SupplierDemo'
#             @global['supplierId'] = 'sid_621679 fid_621679'
#             @global['supplierOrgId'] = '154053'
#
#         when 'release'
#             step 'the buyerOrgId is 152484'
#             @global['buyerGUIUser']      = 'dtv2buyer1'
#             @global['buyerGUIPassword']  = 'dtv2buyer1'
#             @global['buyerSftpUser']     = 'releaseBuyer1'
#             @global['buyerSftpPassword'] = '@mberMatch50'
#             @global['supplier'] = 'QA_SupplierDemo'
#             @global['supplierId'] = 'sid_637446'
#             @global['supplierOrgId'] = '154498'
#
#         when 'regression'
#             step 'the buyerOrgId is TBD'
#
#         else
#             STDOUT.puts "Unexpected value '#{ENV['ICIX_ENV']}' for ENV['ICIX_ENV']"
#             expect(ENV['ICIX_ENV']).to match /integration|stage|uat-directTest|demo|release|regression/
#     end
#     @global['labSftpUser']     = 'test_qa'
#     @global['labSftpPassword'] = 'Join*Clock331'
#     @global['labOrgId']        = 70431
#     step 'I switch to a headless driver'
#     step 'I set the Member Flag "Do not create new Supplier or Requests" in Admin to "No"'
# end
#
# After do |scenario|
#     if (scenario.failed?)
#         puts ''
#         puts '===== DUMP OF VARIABLES USED ====='
#         puts '@rowHash:' + @rowHash.to_s
#         puts '@poHash:' + @poHash.to_s
#         puts '@poMap:' + @poMap.to_s
#         puts '@trHash:' + @trHash.to_s
#         puts '@hash:' + @hash.to_s
#         puts '@global:' + @global.to_s
#         puts '=================================='
#
#         begin
#             subject = scenario.title
#         rescue
#             subject = scenario.scenario_outline.name
#         end
#         time = Time.now.to_i
#         page.driver.render("./testresults/#{time}-failed-#{subject}.png", :full => true)
#         #page.save_screenshot("./testresults/#{time}-failed-#{subject}.png")
#     end
# end
#
