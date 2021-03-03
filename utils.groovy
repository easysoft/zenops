import hudson.model.*;

def read_yaml_file(yaml_file) {
    def data = ""
    if (yaml_file.toString().endsWith(".yml")){
        data = readYaml file : yaml_file
    } else {
        data = readYaml text : yaml_file
    }
    data.each {
        println ( it.key + " = " + it.value )
    }

    return data
}

return this
