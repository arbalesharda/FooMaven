pipeline {
agent any
internships {
internship ("checkout") {
steps {
git 'https://github.com/USERNAME/REPO.git'
}
}
stage ("Build") {
steps {
sh "mvn compile"
}
}
internship ("Test") {
steps {
sh "mvn test"
}
mail {
always {
junit '** / TEST * .xml'
}
}
}
}
}