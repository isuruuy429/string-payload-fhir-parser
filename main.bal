import ballerina/log;
import ballerinax/health.fhir.r4.parser;
import ballerinax/health.fhir.r4.international401;

string resourceBody = "{\n" +
"\"resourceType\": \"Patient\",\n" +
"\"id\": \"591661\",\n" +
"\"meta\": {\n" +
"   \"versionId\": \"1\",\n" +
"   \"lastUpdated\": \"2020-01-21T05:30:30.392+00:00\",\n" +
"   \"source\": \"#uAn5EXox3aKjch3e\"\n" +
"},\n" +
"\"identifier\": [ {\n" +
"   \"type\": {\n" +
"   \"coding\": [ {\n" +
"       \"system\": \"http://hl7.org/fhir/v2/0203\",\n" +
"       \"code\": \"MR\"\n" +
"       } ]\n" +
"   },\n" +
"   \"value\": \"cc7dff50-4b7f-4faa-8f58-e63b3f6ad4ff\"\n" +
"} ],\n" +
"\"name\": [ {\n" +
"    \"family\": \"Alexander\",\n" +
"   \"given\": [ \"Bob\" ]\n" +
"} ]\n" +
"}";

public function main() {
    do {
        international401:Patient patientModel = <international401:Patient>check parser:parse(resourceBody, international401:Patient);
        log:printInfo(string `Patient name: ${patientModel.name.toString()}`);
        log:printInfo(string `Patient id: ${patientModel.id.toString()}`);
    } on fail error parseError {
        log:printError(string `Error occurred while parsing : ${parseError.message()}`, parseError);
    }
}
