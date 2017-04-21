FROM sonarqube:6.2
MAINTAINER Kevin Wennemuth <feffi@feffi.org>

# ----------------------------------------------------------------------- sonarqube settings
ENV SONARQUBE_HOME="${SONARQUBE_HOME}"
ENV SONARQUBE_PLUGINS="${SONARQUBE_HOME}/extensions/plugins"

# ----------------------------------------------------------------------- system and proxy settings
ENV RANCHER_METADATA_URL="http://rancher-metadata/2016-07-29"

# ----------------------------------------------------------------------- install plugins
ENV SCMCVS_PLUGIN_VERSION 1.0
ENV COCKPIT_PLUGIN_VERSION 1.7.0
ENV PHP_PLUGIN_VERSION 2.9.1.1705
ENV PLI_PLUGIN_VERSION 1.4
ENV PLSQL_PLUGIN_VERSION 2.8
ENV PYTHON_PLUGIN_VERSION 1.6
ENV SVN_PLUGIN_VERSION 1.3
ENV SWIFT_PLUGIN_VERSION 2.0.0.1127
ENV GITLAB_PLUGIN_VERSION 1.7.0
ENV SCMGIT_PLUGIN_VERSION 1.2
ENV OWASP_PLUGIN_VERSION 1.0.3
ENV JAVA_PLUGIN_VERSION 4.3.0.7717
ENV FINDBUGS_PLUGIN_VERSION 3.5
ENV LDAP_PLUGIN_VERSION 2.1
ENV SCMSTAT_PLUGIN_VERSION 0.3.1
ENV TIMELINE_PLUGIN_VERSION 1.5
ENV WIDGET_PLUGIN_VERSION 1.7
ENV SONARGRAPH_PLUGIN_VERSION 3.4.2
ENV JS_PLUGIN_VERSION 2.18
ENV ISSUE_ASSIGN_PLUGIN_VERSION 1.6
ENV BUILD_BREAKER_PLUGIN_VERSION 1.1
ENV ISSUES_DENSITY_PLUGIN_VERSION 1.0
ENV PMD_PLUGIN_VERSION 2.4.1
ENV BUILD_STABILITY_PLUGIN_VERSION 1.3
ENV GENERIC_COVERAGE_PLUGIN_VERSION 1.1
ENV GROOVY_PLUGIN_VERSION 1.2
ENV MOTION_CHART_PLUGIN_VERSION 1.7
ENV WEB_PLUGIN_VERSION 2.5.0.476
ENV XML_PLUGIN_VERSION 1.4.1

ENV PLUGINS=" \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-scm-cvs-plugin/${SCMCVS_PLUGIN_VERSION}/sonar-scm-cvs-plugin-${SCMCVS_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/CommercialDistribution/sonar-dev-cockpit-plugin/sonar-dev-cockpit-plugin-${COCKPIT_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-php-plugin/sonar-php-plugin-${PHP_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/CommercialDistribution/sonar-pli-plugin/sonar-pli-plugin-${PLI_PLUGIN_VERSION}.jar \
http://sonarsource.bintray.com/CommercialDistribution/sonar-plsql-plugin/sonar-plsql-plugin-${PLSQL_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-python-plugin/sonar-python-plugin-${PYTHON_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-scm-svn-plugin/sonar-scm-svn-plugin-${SVN_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/CommercialDistribution/sonar-swift-plugin/sonar-swift-plugin-${SWIFT_PLUGIN_VERSION}.jar \
http://nexus.talanlabs.com/content/groups/public_release/com/synaptix/sonar-gitlab-plugin/${GITLAB_PLUGIN_VERSION}/sonar-gitlab-plugin-${GITLAB_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-${SCMGIT_PLUGIN_VERSION}.jar \
https://bintray.com/artifact/download/stevespringett/owasp/org/sonarsource/owasp/sonar-dependency-check-plugin/${OWASP_PLUGIN_VERSION}/sonar-dependency-check-plugin-${OWASP_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-findbugs-plugin/sonar-findbugs-plugin.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-ldap-plugin/${LDAP_PLUGIN_VERSION}/sonar-ldap-plugin-${LDAP_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-scm-stats-plugin/${SCMSTAT_PLUGIN_VERSION}/sonar-scm-stats-plugin-${SCMSTAT_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/${TIMELINE_PLUGIN_VERSION}/sonar-timeline-plugin-${TIMELINE_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-widget-lab-plugin/${WIDGET_PLUGIN_VERSION}/sonar-widget-lab-plugin-${WIDGET_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-sonargraph-plugin/${SONARGRAPH_PLUGIN_VERSION}/sonar-sonargraph-plugin-${SONARGRAPH_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JS_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-issue-assign-plugin/${ISSUE_ASSIGN_PLUGIN_VERSION}/sonar-issue-assign-plugin-${ISSUE_ASSIGN_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-build-breaker-plugin/${BUILD_BREAKER_PLUGIN_VERSION}/sonar-build-breaker-plugin-${BUILD_BREAKER_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-issues-density-plugin/${ISSUES_DENSITY_PLUGIN_VERSION}/sonar-issues-density-plugin-${ISSUES_DENSITY_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/java/sonar-pmd-plugin/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-build-stability-plugin/${BUILD_STABILITY_PLUGIN_VERSION}/sonar-build-stability-plugin-${BUILD_STABILITY_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-generic-coverage-plugin/${GENERIC_COVERAGE_PLUGIN_VERSION}/sonar-generic-coverage-plugin-${GENERIC_COVERAGE_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/org.sonarsource.sonar-groovy-plugin/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar \
http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-motion-chart-plugin/${MOTION_CHART_PLUGIN_VERSION}/sonar-motion-chart-plugin-${MOTION_CHART_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar \
https://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar"

# ----------------------------------------------------------------------- remove bundled plugins
RUN ls -la ${SONARQUBE_HOME}/lib/bundled-plugins && \
    rm -rf ${SONARQUBE_HOME}/lib/bundled-plugins/sonar-java-plugin-*.jar && \
    cd ${SONARQUBE_PLUGINS} && \
    for p in ${PLUGINS}; \
    do \
        curl -#kSLO ${p}; \
    done && \
    ls -lah ${SONARQUBE_PLUGINS} && \
    ls -alh ${SONARQUBE_HOME}/lib/bundled-plugins
