Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672053E5ED4
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919719; cv=none; b=qf4PKQM4sytBWcMlcq+rh4F5YH5JtkNlD8gHfzvB9NPdJcfbbRDDVLbqGXBP3JPbnEPEGlcvgX9xUaEkrZtD919Tt8l7RV3eX+tJLnrpKcUlJXmmedLWqTG9A0ye7B2dOpVriEyJPyBsGCCRMQ1MvIUd9Xwad0NkfuvWLqhlYVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919719; c=relaxed/simple;
	bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVd6gnJc8ZZnPieIhG5UohPLsHL8dhDWRJ/Aopk4hrf486+qh96PjR+L/53PK0Ys9FtAGHtk4ksjsNOmV+eAwoW5crohGGnYGYU7ys7ktITizZ5HdRyUPGYk2ug2QUQPyO4Vm6napsL+NLeX2FkUIwDXako8sMJI8b+l4D1EAAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MIh3YZgw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MIh3YZgw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so30380375e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919714; x=1778524514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=MIh3YZgwcQY+lfaM6f/2hSjNmS2XHJyF7O8hU/VapEvteU/Rt6N/QGfx4aGCzuBfYE
         pjh6ALIieZjYS3HaNzZWM5NVqIiWBgejeDWeX0XYCcBdy3S8jPF80hyCSx2jEOCQRUw2
         L6wvau1W4Uda+1R3aRfxB6RhLlDby9UTwLG48Xjjf+duDavhiaWJ83fBlIKdyTJh6HT6
         F92hjbMKJ5/L7xi/li/5/iTArTckEK0MBs+aPJv6WNhH3+7wsklZaiGxhXngob7Qpxtc
         JGoEzd28R5s9YuEYSZBnI/dTx/CYkfpgq8knTeKWYlFepj4Ngrho4tH1HCtoFVhKMAqg
         JELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919714; x=1778524514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=hczYZ0B8DTrbMecTeR0T5kFek66bXPLiEHZ/B01FF928I/ciFF5CORMa8RNj+JfEZ+
         Kf7+yS0z68LFnYuejBuYmjmaSoLU9kYLxjP93MgTTFNO0fb6ARGKUrX0MmWCg/1nP3+W
         6lJ2TLurp0te2iGJ6uZ+uMvv81GvoyWwgUl0YFlPt0JhYWf7wXh4ghaX4cOmOork1t0P
         j807gg+PlLBOR4uov+fLqpodtkFl7808HkZaHBxSC44Y98acBF1lbeeUNtQoyC6bA/oo
         XUbnNwCWoffZyBsiNappjSOvGxj4Tfi+Tmgvuf2cPJtkoeVW0tLCaLuhqjpZX8BZW8Cj
         PlYw==
X-Forwarded-Encrypted: i=1; AFNElJ+T3vm6YY6iDiTjxQ6d8KsYISFt1zT41sJI50xOrIwvEhN75+HRYdwwTu5LsNwxTYrL9zAlQEuhKc9niVKV9+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv2+CEnSrWcwZ/nWnXvTWoVS7MFcr4XCQ6TaUGle5sP7MTxozd
	9IFKpIS6mljvFBB2xKZuUt2Ehuc/qe7kmSqUnLrxBZP9k30geJ+XVsKrvp/drQAsN6M=
X-Gm-Gg: AeBDieun4ftq8Yg3v4GCHgtzjeLPiNg658xtZtOKOmJk7xLb50tELRDyUAQaY5Aca3d
	knxsvfNrGiorsjv7aSE9C23jAWmkEQOCGJLAL7TbEEs1q66HWi+SQPJqDtMHbTnVdGLR7Y55gPm
	h6zTDUMeV3bYOkDT/wBcJH+RJ1u8q1JL53OrD+ZcK2K+iNV0BwvQ24qYO6ElS34QjBHQWLL/CeE
	KjmhpzcFjQikXqF55c8hL4UUDITPMUz5Zb/+u4laI7c33Pc+Fm2M4gkI/OQPQ3QicuezCb9p9qR
	dg4flo3FlyYSoyZgNUXRgDivXXbDziwESI5Lw/MpV2Xhp+tfjBa9YzZvjdoqP204/DXOaBa0j4n
	5FtaOOx6AvTJuX4UPJyB9GDMnO0VPbjnxiy6/3ww1H/ib9PeffZmIkebRxGf3mpLrNYlfcSnNjo
	w4lOwCzO2HtL9P8IterL8skl93Mhss6TdI9Q==
X-Received: by 2002:a05:6000:4185:b0:44b:5a37:36c4 with SMTP id ffacd0b85a97d-44fdf21c263mr846289f8f.26.1777919714291;
        Mon, 04 May 2026 11:35:14 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:14 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 04 May 2026 15:34:44 -0300
Subject: [PATCH v5 3/6] selftests: livepatch: Introduce does_sysfs_exist
 function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-lp-tests-old-fixes-v5-3-0be26d94ab9a@suse.com>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=1087;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
 b=xEIWz0+yEclXAyLG6pKQNfJzvV5laNiryR+3nDpFPz3Hkej5nUD5QebhOsozzUiaV2yImPQaH
 T2/YF6b0iK7AH7VTr1yYJ3lUpYUvXehnHIm4+XwXRPlvqORNmFVNucP
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Returns true if the livepatch sysfs attribute exists, and false otherwise.
This new function will be used in the next patches.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94..2bc50271729c 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -339,6 +339,16 @@ function check_result {
 	fi
 }
 
+# does_sysfs_exist(modname, attr) - check sysfs attribute existence
+#	modname - livepatch module creating the sysfs interface
+#	attr - attribute name to be checked
+function does_sysfs_exist() {
+	local mod="$1"; shift
+	local attr="$1"; shift
+
+	[[ -f "$SYSFS_KLP_DIR/$mod/$attr" ]]
+}
+
 # check_sysfs_rights(modname, rel_path, expected_rights) - check sysfs
 # path permissions
 #	modname - livepatch module creating the sysfs interface

-- 
2.54.0

