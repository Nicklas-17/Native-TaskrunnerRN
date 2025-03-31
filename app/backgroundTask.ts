import { NativeModules } from "react-native";

console.log("All native modules:", NativeModules);
const { BackgroundTaskManager } = NativeModules;

export const registerBackroundTask = () => {
  if (!BackgroundTaskManager) {
    console.error("BackgroundTaskManager module not found!");
    return;
  }

  if (typeof BackgroundTaskManager.registerBackgroundTask !== "function") {
    console.error("registerBackgroundTask method not found on BackgroundTaskManager!");
    console.log("Available methods:", Object.keys(BackgroundTaskManager));
    return;
  }

  try {
    return BackgroundTaskManager.registerBackgroundTask("com.nativeTaskrunner.task");
  } catch (error) {
    console.error("Error calling registerBackgroundTask:", error);
  }
};

export default {};
