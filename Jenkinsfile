pipeline
{
    agent any
           stages
           {
                stage('Checkout')
                {
                    steps
                    {
                        git 'https://github.com/arbalesharda/FooMaven.git'
                    }
                }
                stage(' Build')
                {
                    steps
                    {
                       sh "mvn compile"
                    }
                }
                stage(' Test')
                {
                    steps
                    {
                        sh "mvn test"
                    }
                post
                {
                    always
                    {
                        junit '**/TEST*.xml'
                    }
                }
           }
            stage('Create coverage report') {
                     steps {
                         sh "mvn cobertura:cobertura"
                          }
                      }
           stage('API Testing with Newman') {
                 steps {
                      sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
                       }
                        post {
                            always {
                                     junit '**/*xml'
                                    }
                             }

            }
           stage('Robot Framework System tests with Selenium') {
                       steps {
                           sh 'robot -d results --variable BROWSER:headlesschrome CarBooking.robot'
                       }
                       post {
                           always {
                               script {
                                     step(
                                           [
                                             $class              : 'RobotPublisher',
                                             outputPath          : 'results',
                                             outputFileName      : '**/output.xml',
                                             reportFileName      : '**/report.html',
                                             logFileName         : '**/log.html',
                                             disableArchiveOutput: false,
                                             passThreshold       : 50,
                                             unstableThreshold   : 40,
                                             otherFiles          : "*/.png,*/.jpg",
                                           ]
                                      )
                               }
                           }
                       }
                   }




      }

     post {
             always {
                     junit '**/*xml'
                     step([$class: 'CoberturaPublisher', autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/coverage.xml', failUnhealthy: false, failUnstable: false, maxNumberOfBuilds: 0, onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false])

             }
         }
}