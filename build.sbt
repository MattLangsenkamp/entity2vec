ThisBuild / version := "0.1.0"

ThisBuild / scalaVersion := "3.2.2"
val djlVersion = "0.21.0"

lazy val root = (project in file("."))
  .settings(
    name := "entity2vec",
    libraryDependencies ++= Seq(
      "ai.djl" % "api" % djlVersion,
      // pytorch
      "ai.djl.pytorch" % "pytorch-engine" % djlVersion,
      "ai.djl.pytorch" % "pytorch-model-zoo" % djlVersion,
      "ai.djl.pytorch" % "pytorch-native-cu113" % "1.11.0",
      "ai.djl.pytorch" % "pytorch-jni" % "1.13.1-0.21.0",

      "org.slf4j" % "slf4j-api" % "2.0.5",
      "org.slf4j" % "slf4j-simple" % "2.0.5",
      "tech.tablesaw" % "tablesaw-jsplot" % "0.43.1"
    )
  )
