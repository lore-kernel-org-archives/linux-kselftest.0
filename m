Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29192322A
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783831657; cv=none; b=TmCJZ7L8WMZudr1XqbS61motMAz3HCPonv7W2eT/TlBNoaJ5EMHqguntbGSQ6zb40n5wZjNDaSH90mz5lzEKfORkq62eXx/6B4oPDtVyy3HWefMQbhI9inrHV1PO3acFbm7DCUXlKlrBE6/9I2lSNXLG+hJOaF9lt5OgUQW1qNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783831657; c=relaxed/simple;
	bh=zFIrTtOqjdO3+IkDV652CpGMyKnVbAlNiv0Ym4owJaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IusetnYJu2UcjgEPfwLZ3bcD+zjRRlDA/3syxBA/4R1zPNvtw3Q9cnhgKmbjoHAqmlwL2lYQR9USyekbV3FELx+AC4DF0Zmotz8n7a0unuuGkBTAguxyqn31XRWQNnNBqE4uUKNbhTTUI9GAl23GQPivIwynmUEtiwVyATxPU9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=masoncamara.com; spf=pass smtp.mailfrom=masoncamara.com; dkim=pass (2048-bit key) header.d=masoncamara-com.20251104.gappssmtp.com header.i=@masoncamara-com.20251104.gappssmtp.com header.b=vWkP3IfZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=masoncamara.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=masoncamara.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=masoncamara-com.20251104.gappssmtp.com header.i=@masoncamara-com.20251104.gappssmtp.com header.b="vWkP3IfZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864086bfeso2125040b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=masoncamara-com.20251104.gappssmtp.com; s=20251104; t=1783831655; x=1784436455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNkBXOfLF0O7asfBZN+v8AnyzGHcufqmHpC8s/f24kg=;
        b=vWkP3IfZCTvELT1NYtdL1ONnoOQzdQ2TZDXWjK7WH+Q+cvrJAWKiKLws/5mtRKIOSy
         FCSniVjI0UH0xIliugNSRtOhUHDXrvf8jbAFKZqIP7SIZIQmXOBEqvuDxcZbYFJ06c7F
         vcGMQcV8zIOsU+aYXaA3JTdarqR82o7+tyijOpW0//5AtKwKecE+Qv558ARSbQhI+/0I
         EL+FNCv5jutLnLiGuTcdqHIviY6VTe//Sb9OLNC8K0gsnHNWWeV1h8DGb4Vy+apmiTif
         LfM8dkXk0cQ/7hgjAUtzEzHVfWRKnCpWA2voCXFny6ONziuMX5lZxqvOK5v9owR58G7L
         p/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783831655; x=1784436455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNkBXOfLF0O7asfBZN+v8AnyzGHcufqmHpC8s/f24kg=;
        b=iMu1UUrrSqwajkblxpaC3S8FzyI3TL7CXW8II5fllbVcXM0Zw9TfQq2JQ7PvmwG/wj
         g3xPxqMpXyEqL3z3IXZ9cqJ5/OReJwq//3wqmwx6XvroX2sAOKQJU/UpoCAgMnByTJut
         KpYmwryILTOoG73Brt6VdLUs/bngXBpjOt3RQEmso2D8vQ+TgocPkcltqV2vTIvqljxN
         ABzVo8dQRxTbcuZ0tXfXTmrZ0OkbNvK6QK+2tp8UZCfRS1F6PFwy9eMrk1TMehxTX78J
         de0GRcI8fg4Pbty8XkphkvDk8UPMSu/mhX18242wdojpdKbutoznB/vMCe8rUkb0QC2u
         lblw==
X-Forwarded-Encrypted: i=1; AHgh+RpyY728BNQHHsKwh1pu4qffI1q16NY+eX+NsvUlWmzvDqVmoTBADwbBgRjinxTZUkgx4MYkbdjwDYkTNeUb/ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPJtKuBj4XP+5BH0r+1Cl0znJqEXOAPkHGdaQJ9FWF7RmLoDL
	P+CYTtbK2q+HvHDsVhjxfeVHYQSCloD1RkAypIfwlrvidVjA4xj0vw6QZLdJZEFFU/6rbJvJ1Qp
	nbMrd8oE1XCw=
X-Gm-Gg: AfdE7cl+UWFsUfDjHxynW9OYtz5SnJ8TOY2b+ro3TntDyzWYp1yMfsXXnzRDxMoe8aE
	S9Smc/TbpjNneDx1ICE/Aaqj4dPdLOnWDRe4AZgwGsXMsFYQgBzBhd8098KqT6rjzgXhawR/oBN
	vBJrES/RVdUK+PXiS54oii46Mm8tXhk0wV1bnkiZW8Nl20dSjZcqZGQHoPhVxUAUuJ9EV7b+lQG
	YywYd6f+y11N6MXsZLQPFlnJdgYUQq5LrlBasz9FBKTvgmSpG/lCk6uE/6OCk8Jktn8abpHqmmG
	2ernhh5PjRsEpYIvdvMexsMV6FiJkg9omTYoXoDJr1M/9ttWizZtGS0MMZtDWYg4tUyQoicgwtA
	OQY/dojZiEhNpnnEhvxVCWtT59jH+TcnlPkOPsCgDGlJKhpKEn1YYDp8phlDbq6A6oyzmxRbUz7
	chV1BDZ4s0maYn5P3lKrgexNu6pAJWyoQcJIr/0g==
X-Received: by 2002:a05:6a20:9185:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3c1108b5a56mr5015548637.21.1783831655501;
        Sat, 11 Jul 2026 21:47:35 -0700 (PDT)
Received: from nobara ([69.26.129.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm59384338eec.14.2026.07.11.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:47:35 -0700 (PDT)
From: Mason Camara <ping@masoncamara.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	John Chen <johnchen902@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: input: honor report field offsets in battery queries
Date: Sat, 11 Jul 2026 22:47:01 -0600
Message-ID: <20260712044702.893825-2-ping@masoncamara.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712044702.893825-1-ping@masoncamara.com>
References: <20260712044702.893825-1-ping@masoncamara.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidinput_query_battery_capacity() always reads buf[1] from a GET_REPORT
reply. This assumes capacity usage starts at bit 0 of the report payload
and that capacity occupies the first byte.

The Magic Mouse 2 puts a status byte before AbsoluteStateOfCharge in
input report 0x90. Its GET_REPORT response is:

  90 04 5f

Here 0x04 is the status byte and 0x5f is the capacity. Reading buf[1]
reports 4% in sysfs.

This query runs when userspace reads capacity before an input report
updates the battery cache. The event path already extracts the usage
from the descriptor, so moving the mouse before the sysfs read can hide
the bug.

Record the report containing the capacity field, bit offset, and size when
setting up the battery. Allocate a buffer large enough for the complete
report, skip the report ID byte, and extract the value at the recorded bit
offset. Reject replies that do not contain the complete field.

Fixes: 9de07a4e8d4c ("HID: input: map battery capacity (00850065)")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221263
Assisted-by: Codex:GPT-5
Signed-off-by: Mason Camara <ping@masoncamara.com>
---
 drivers/hid/hid-input.c | 39 +++++++++++++++++++++++++++++----------
 include/linux/hid.h     |  6 ++++++
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 3487600cadb4..01ce9e176299 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -431,18 +431,28 @@ static int hidinput_scale_battery_capacity(struct hid_battery *bat,
 
 static int hidinput_query_battery_capacity(struct hid_battery *bat)
 {
+	u8 *buf __free(kfree) = NULL;
+	unsigned int field_end;
+	unsigned int report_len;
+	u32 value;
 	int ret;
 
-	u8 *buf __free(kfree) = kmalloc(4, GFP_KERNEL);
+	report_len = hid_report_len(bat->report) + !bat->report->id;
+	buf = hid_alloc_report_buf(bat->report, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(bat->dev, bat->report_id, buf, 4,
+	ret = hid_hw_raw_request(bat->dev, bat->report_id, buf, report_len,
 				 bat->report_type, HID_REQ_GET_REPORT);
-	if (ret < 2)
+	field_end = DIV_ROUND_UP(bat->report_offset + bat->report_size, 8) +
+		    1;
+	if (ret < 0 || (unsigned int)ret < field_end)
 		return -ENODATA;
 
-	return hidinput_scale_battery_capacity(bat, buf[1]);
+	value = hid_field_extract(bat->dev, buf + 1, bat->report_offset,
+				  bat->report_size);
+
+	return hidinput_scale_battery_capacity(bat, value);
 }
 
 static int hidinput_get_battery_property(struct power_supply *psy,
@@ -529,7 +539,8 @@ static void hidinput_cleanup_battery(void *res)
 }
 
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
-				  struct hid_field *field, bool is_percentage)
+				  struct hid_field *field, unsigned int usage_index,
+				  bool is_percentage)
 {
 	struct hid_battery *bat;
 	struct power_supply_desc *psy_desc;
@@ -593,6 +604,10 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	bat->max = max;
 	bat->report_type = report_type;
 	bat->report_id = field->report->id;
+	bat->report = field->report;
+	bat->report_offset = field->report_offset +
+			     usage_index * field->report_size;
+	bat->report_size = field->report_size;
 	bat->charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
 	bat->status = HID_BATTERY_UNKNOWN;
 
@@ -687,7 +702,8 @@ static void hidinput_update_battery(struct hid_device *dev, int report_id,
 }
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
-				  struct hid_field *field, bool is_percentage)
+				  struct hid_field *field, unsigned int usage_index,
+				  bool is_percentage)
 {
 	return 0;
 }
@@ -1035,7 +1051,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 
 		case 0x3b: /* Battery Strength */
-			hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field,
+					       usage_index, false);
 			usage->type = EV_PWR;
 			return;
 
@@ -1313,7 +1330,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	case HID_UP_GENDEVCTRLS:
 		switch (usage->hid) {
 		case HID_DC_BATTERYSTRENGTH:
-			hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field,
+					       usage_index, false);
 			usage->type = EV_PWR;
 			return;
 		}
@@ -1322,7 +1340,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	case HID_UP_BATTERY:
 		switch (usage->hid) {
 		case HID_BAT_ABSOLUTESTATEOFCHARGE:
-			hidinput_setup_battery(device, HID_INPUT_REPORT, field, true);
+			hidinput_setup_battery(device, HID_INPUT_REPORT, field,
+					       usage_index, true);
 			usage->type = EV_PWR;
 			return;
 		case HID_BAT_CHARGING:
@@ -2040,7 +2059,7 @@ static void report_features(struct hid_device *hid)
 				/* Verify if Battery Strength feature is available */
 				if (usage->hid == HID_DC_BATTERYSTRENGTH)
 					hidinput_setup_battery(hid, HID_FEATURE_REPORT,
-							       rep->field[i], false);
+							       rep->field[i], j, false);
 
 				if (drv->feature_mapping)
 					drv->feature_mapping(hid, rep->field[i], usage);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index b240baa95ab5..396de1080fdc 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -642,6 +642,9 @@ enum hid_battery_status {
  * @max: maximum battery value from HID descriptor
  * @report_type: HID report type (input/feature)
  * @report_id: HID report ID for this battery
+ * @report: HID report containing the capacity field
+ * @report_offset: bit offset of the capacity field in the report
+ * @report_size: size of the capacity field in bits
  * @charge_status: current charging status
  * @status: battery reporting status
  * @capacity: current battery capacity (0-100)
@@ -657,6 +660,9 @@ struct hid_battery {
 	__s32 max;
 	__s32 report_type;
 	__s32 report_id;
+	struct hid_report *report;
+	__u32 report_offset;
+	__u32 report_size;
 	__s32 charge_status;
 	enum hid_battery_status status;
 	__s32 capacity;
-- 
2.55.0

