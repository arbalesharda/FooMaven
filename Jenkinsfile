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
bat "mvn compile"
}
}
internship ("Test") {
steps {
bat "mvn test"
}
mail {
always {
junit '** / TEST * .xml'
}
}
}
}
}