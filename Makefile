CUCUMBER_FLAGS:=$(CUCUMBER_FLAGS) -f junit -o testresults/cucumber-report -f json -o testresults/cucumber-report.json -f pretty

error:
	exit 1

clean:
	@rm -rf testresults

githooks:
	@rm -rf .git/hooks
	@ln -s ../git_hooks .git/hooks

install-test:
	@bundle install

install-localgems:
	@bundle install --path=vendor/bundle

test-daily: clear-results install-localgems
	@echo ---- DAILY ----
	@AUTOTEST=false bundle exec cucumber src/test/cucumber -t @daily

clear-results:
	@rm -rf testresults
	@mkdir -p testresults/cucumber-report