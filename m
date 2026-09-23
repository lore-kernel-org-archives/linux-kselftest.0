Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391053B337
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174992; cv=none; b=okztSgjLbjiMW57M+GB0og0e29MXTyL+7bcgBPv3ITDm/RyXIP9k9E+OrXH7y5n6+99CVg/vyRuGRIxKEjM41bluGliqNHNVrRRc9TNIDJWGb0XNILYQfkBVf1CWjOceOHhwetixcy70oNHDZzkxL/9DLx2wmfVqTQSpVLTfW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174992; c=relaxed/simple;
	bh=D7CW/L5x2Wzbfvs/Ry3HQFjuRxjKXKVxOFbyRvCgGRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkFgQ1f7z1vpPHLV9s57YiYUqiwKPqzjwqyWKlaO0DGs1hSUWCMbbGx2BGZW1Tq4mVyZp4CiFyWTQp6UhVOwOYH4T4PfnQdvziT+bFmqmv2wbSHIDR1qV8aei8vGf0ymTaEN7gcircZ+9Xj6Fmz6YgnqRE5+ISKbsttNbki+axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKG+MpJL; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKG+MpJL"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so758252a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174990; x=1790779790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxVNMYiWuEb3uiOivIQYfnI77XxUaLJxdPfRt2FjCgs=;
        b=NKG+MpJLYc+AHT22Yc4AL9pyNPXqb8U8akuel0SkFCsJrRVlUC53H5YBYZOWqUr0vT
         91hBD0+J34R2DYsoWF2XNLoUlULxxp9FssJrevk+mWkfHXm7hlZdA+e8yVhMaw91Vgyo
         kMgd5CiKtaAYnmjA7+Mj5a8KnwOQ7G6zoavKfWry4AsjzCbjBDyLjFnzWFWJ+syE41YE
         gs+PL0HtfErNhf/cHFVZCtJ7GJ7Ek12e+hBkk/I/MlzzwXegP+9HkUxbs00WMfimN9fj
         yt8P6ZUwq0tX1en+byzEvURWv3UKIRBj+6mcx+iGaTJoUnvSgaAafp10RgaKYtn9IGWx
         pNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174990; x=1790779790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxVNMYiWuEb3uiOivIQYfnI77XxUaLJxdPfRt2FjCgs=;
        b=yzAVwkNigyQr9xS5zC+SXAQxMAQOn8wv9VggaUuOphUD4kHxNgzGRGQ1hHYuO6zuQm
         oxWQ1OvU9WvZjpW6rnungHEWBVPGipO0OxiRVvN90EFybuX/I6wliA9sSXYzd5n0Y952
         yxPZaDafPC2OYbCht7yNPu0sDRcPHj+qTHOW1pIfUfOfaeMnzzYATeoI7Ta4jeSwDd8b
         Z+yrvydL2BRRrPSvw4VMnSjVB94qLhXTuReYeKlflQ6tq77UEsEu7YcYFywjUdGQM8RP
         KlZUGVqt3LVTzFdYsNQKsShMYIsi3i8fbj7lzpDoA2/IrXH4nrkDtnnYF7gVNg8Nx9VV
         FbUg==
X-Forwarded-Encrypted: i=1; AKwUvBzC4iTgcZzdEcfA2azoNxYGcHynHIcTiUXWwUigHIedyPTmskxm6s+fkt3Rw1R11jQ6fqzfqAXTSPs4QifWywA=@vger.kernel.org
X-Gm-Message-State: AFuF++mjsPMfvSHE69pCWIthWKOhO0QG4K/pGZwfh7skbnCeWhGra/Wi
	QILFz+hczCyAYJLIuEV3mr7EeQ8EM61/3IQbzAoCARhqiaTvDaCt7i9I
X-Gm-Gg: AYBFou3okXQhY7xdoCbme1bnrohIqrtQkMZ/CK1cfeFxwGJ15q5VxgXkmltWQAMklBq
	+SJKJdC/tqSMWhgXsi8Gev/oGKl5NYCKQMaGJMcw+snB6IusXQ9km67HXn5aAZG3PMX8xZy9wxZ
	MlPwIp3vkFrxqai4AYlAz4Z+cKTc062Tt/m6Gj8UJWFTUCR72gUyRfGImudnGyVoePR5MpK2uaR
	l6BT41uHXilJdsUnGil4zxX+jC451ikUPX+XfEflPzp3+ek5In4mhdJ2DI7tBAEpZEMLrN2CSFU
	wJ2+7hC1pl3vWvRuQ73ZCcT+npBwjqsIaorNMLZ7nx/aUYUVk4t1nbyrGzM/1xeXK3nVqUXK+IQ
	Lnp5uZyCf0E5m9QyvbI9ppfegejJTBw3bazB9Wl+P3FPZky+1M9a+7vISHj6h+WJxxtv4kGgqfz
	mxfPYKomU3hJKcgALsE9qZZrgNIRLalvxPb9cf/MdrLqeTtaSaP21xTpwRte+bHzcCiNoBf2uNL
	h8OB/Q6vAkkYCGicmDJQg==
X-Received: by 2002:a17:90b:3811:b0:39e:6c69:9b91 with SMTP id 98e67ed59e1d1-3a07e69fec5mr2606939a91.54.1790174990257;
        Wed, 23 Sep 2026 07:49:50 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc4109dsm6469824a91.14.2026.09.23.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:50 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] sysctl: Add jiffies converter entries to the test module
Date: Wed, 23 Sep 2026 22:49:36 +0800
Message-ID: <20260923144940.3712965-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923144940.3712965-1-zhanxusheng@xiaomi.com>
References: <20260923144940.3712965-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lib/test_sysctl.c covers proc_dointvec(), proc_douintvec(),
proc_dostring(), proc_do_large_bitmap() and proc_dou8vec_minmax(), but
none of the jiffies converters.  Their int paths report the sign
separately from the magnitude, which is a shape the existing entries do
not exercise at all.

Add one entry per affected int converter: proc_dointvec_jiffies(),
proc_dointvec_ms_jiffies() and proc_dointvec_userhz_jiffies().  Each is
seeded with HZ jiffies, which is one second in every converter's own
unit, so the three read back as 1, 1000 and 100 respectively.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 lib/test_sysctl.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/test_sysctl.c b/lib/test_sysctl.c
index 909cfcf76dbf..7718cf4ffd47 100644
--- a/lib/test_sysctl.c
+++ b/lib/test_sysctl.c
@@ -15,6 +15,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/jiffies.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/printk.h>
@@ -48,6 +49,10 @@ struct test_sysctl_data {
 
 	int boot_int;
 
+	int int_jiffies;
+	int int_ms_jiffies;
+	int int_userhz_jiffies;
+
 	unsigned int uint_0001;
 
 	char string_0001[65];
@@ -67,6 +72,11 @@ static struct test_sysctl_data test_data = {
 
 	.boot_int = 0,
 
+	/* One second in each converter's unit; all three store HZ jiffies. */
+	.int_jiffies = HZ,
+	.int_ms_jiffies = HZ,
+	.int_userhz_jiffies = HZ,
+
 	.uint_0001 = 314,
 
 	.string_0001 = "(none)",
@@ -113,6 +123,27 @@ static const struct ctl_table test_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
 	},
+	{
+		.procname	= "int_jiffies",
+		.data		= &test_data.int_jiffies,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_jiffies,
+	},
+	{
+		.procname	= "int_ms_jiffies",
+		.data		= &test_data.int_ms_jiffies,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_ms_jiffies,
+	},
+	{
+		.procname	= "int_userhz_jiffies",
+		.data		= &test_data.int_userhz_jiffies,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_userhz_jiffies,
+	},
 	{
 		.procname	= "uint_0001",
 		.data		= &test_data.uint_0001,
-- 
2.43.0

