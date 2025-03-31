
# Native-TaskrunnerRN


Introduction

Native-TaskrunnerRN is a React Native module that provides a simple interface for scheduling background tasks on iOS. The primary goal of this project is to offer a way to leverage iOS’s native background task management system within a React Native environment, allowing developers to execute tasks in the background even when the app is not in the foreground.



## Why This Project? : 


When building mobile apps, there are times when tasks such as data fetching, syncing, or processing need to continue even if the app is not actively being used. On iOS, background tasks are managed through the BackgroundTasks framework. React Native, however, does not provide a built-in way to interact with this feature directly.

This project was created to address this gap. By wrapping iOS's background task system into a native module, I’ve made it easier for React Native developers to implement background tasks without needing to dive deep into Swift or Objective-C. It allows developers to schedule tasks and manage their execution in the background with minimal configuration.
## Features

- Register Background Tasks: Register background tasks with iOS using the BGTaskScheduler API.
- Handle Task Expiration: Automatically handle task expiration and failure.

- Scheduled Task Execution: Schedule the next background task after the current one completes.


How It Works

This module leverages iOS’s BGTaskScheduler to register background tasks, which can be scheduled to run after a specified delay or at system-defined intervals. When a task is triggered, it’s handled in the background, and once completed, the system schedules the next one if necessary.

