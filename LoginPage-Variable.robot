*** Variables ***
${url_login}                     https://automate-test.stpb-digital.com/login
${browser}                 chrome
${locator_user}            id=email
${locator_password}        name=password
${locator_btnlogin}        xpath=//*[@id="btn-login"]
${locator_msg_invalid_user}              css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_invalid_password}          css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_login_fail}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_msg_login_null}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_hyperlink_create_account}      xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[4]/p[2]/a