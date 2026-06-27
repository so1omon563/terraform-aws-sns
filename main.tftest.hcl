mock_provider "aws" {}

run "default_topic" {
  command = plan

  variables {
    name = "example"
  }

  assert {
    condition     = aws_sns_topic.topic.name == "example"
    error_message = "Topic name should default to the name variable."
  }

  assert {
    condition     = aws_sns_topic.topic.tags.Name == "example"
    error_message = "Topic Name tag should match the resolved topic name."
  }
}

run "topic_prefix" {
  command = plan

  variables {
    name         = "example"
    topic_prefix = "events"
  }

  assert {
    condition     = aws_sns_topic.topic.name == "example-events"
    error_message = "Topic prefix should be appended to the name variable."
  }
}

run "topic_name_override" {
  command = plan

  variables {
    name                = "example"
    topic_name_override = "explicit-topic"
  }

  assert {
    condition     = aws_sns_topic.topic.name == "explicit-topic"
    error_message = "Topic name override should be used as the topic name."
  }
}

run "fifo_topic" {
  command = plan

  variables {
    name                        = "example"
    fifo_topic                  = true
    content_based_deduplication = true
  }

  assert {
    condition     = aws_sns_topic.topic.name == "example.fifo"
    error_message = "FIFO topics should append the .fifo suffix."
  }

  assert {
    condition     = aws_sns_topic.topic.content_based_deduplication == true
    error_message = "FIFO topics should pass content-based deduplication through."
  }
}
