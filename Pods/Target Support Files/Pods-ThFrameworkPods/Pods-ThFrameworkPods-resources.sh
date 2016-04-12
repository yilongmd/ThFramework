#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

case "${TARGETED_DEVICE_FAMILY}" in
  1,2)
    TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
    ;;
  1)
    TARGET_DEVICE_ARGS="--target-device iphone"
    ;;
  2)
    TARGET_DEVICE_ARGS="--target-device ipad"
    ;;
  *)
    TARGET_DEVICE_ARGS="--target-device mac"
    ;;
esac

realpath() {
  DIRECTORY="$(cd "${1%/*}" && pwd)"
  FILENAME="${1##*/}"
  echo "$DIRECTORY/$FILENAME"
}

install_resource()
{
  if [[ "$1" = /* ]] ; then
    RESOURCE_PATH="$1"
  else
    RESOURCE_PATH="${PODS_ROOT}/$1"
  fi
  if [[ ! -e "$RESOURCE_PATH" ]] ; then
    cat << EOM
error: Resource "$RESOURCE_PATH" not found. Run 'pod install' to update the copy resources script.
EOM
    exit 1
  fi
  case $RESOURCE_PATH in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc" "$RESOURCE_PATH" --sdk "${SDKROOT} ${TARGET_DEVICE_ARGS}"
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib $RESOURCE_PATH --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib" "$RESOURCE_PATH" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av $RESOURCE_PATH ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "$RESOURCE_PATH" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH"`.mom\""
      xcrun momc "$RESOURCE_PATH" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd\""
      xcrun momc "$RESOURCE_PATH" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"$RESOURCE_PATH\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm\""
      xcrun mapc "$RESOURCE_PATH" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE=$(realpath "$RESOURCE_PATH")
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    *)
      echo "$RESOURCE_PATH"
      echo "$RESOURCE_PATH" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "DateTools/DateTools/DateTools.bundle"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-background.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-background@2x.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-reload.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-reload@2x.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-stop.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-stop@2x.png"
  install_resource "SAMCategories/SAMCategories/SAMCategories.bundle"
  install_resource "SAMHUDView/Resources/SAMHUDView-Check.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-Check@2x.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-X.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-X@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button@2x.png"
  install_resource "SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerBack.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerBack@2x.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerNext.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerNext@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome-iPad.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome-iPad@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari-iPad.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari-iPad@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari@2x.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundError.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundError@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationButtonBackground.png"
  install_resource "TSMessages/Pod/Assets/NotificationButtonBackground@2x.png"
  install_resource "TSMessages/Pod/Assets/TSMessagesDefaultDesign.json"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "DateTools/DateTools/DateTools.bundle"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-background.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-background@2x.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-reload.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-reload@2x.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-stop.png"
  install_resource "SAMAddressBar/Resources/SAMAddressBar-stop@2x.png"
  install_resource "SAMCategories/SAMCategories/SAMCategories.bundle"
  install_resource "SAMHUDView/Resources/SAMHUDView-Check.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-Check@2x.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-X.png"
  install_resource "SAMHUDView/Resources/SAMHUDView-X@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-action-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-back-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-forward-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-reload-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-safari-button@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini@2x.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button.png"
  install_resource "SAMWebView/Resources/SAMWebView-stop-button@2x.png"
  install_resource "SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerBack.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerBack@2x.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerNext.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle/SVWebViewControllerNext@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome-iPad.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome-iPad@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Chrome/SVWebViewControllerActivityChrome@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari-iPad.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari-iPad@2x.png"
  install_resource "SVWebViewController/SVWebViewController/UIActivities/Safari/SVWebViewControllerActivitySafari@2x.png"
  install_resource "SVWebViewController/SVWebViewController/SVWebViewController.bundle"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundError.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundError@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon.png"
  install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon@2x.png"
  install_resource "TSMessages/Pod/Assets/NotificationButtonBackground.png"
  install_resource "TSMessages/Pod/Assets/NotificationButtonBackground@2x.png"
  install_resource "TSMessages/Pod/Assets/TSMessagesDefaultDesign.json"
fi

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "`realpath $PODS_ROOT`*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
