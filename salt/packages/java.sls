adoptium-temurin-java-repository:
  pkg:
    - installed
temurin-8-jdk:
  pkg:
    - installed

temurin-11-jdk:
  pkg:
    - installed

temurin-17-jdk:
  pkg:
    - installed

java-21-openjdk:
  pkg:
    - installed

java-latest-openjdk:
  pkg:
    - installed

{% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'framework.localdomain' -%}
java-latest-openjdk-devel:
  pkg:
    - installed

java-21-openjdk-devel:
  pkg:
    - installed

java-25-openjdk-devel:
  pkg:
    - installed
{%- endif %}
