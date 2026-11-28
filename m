Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890467;
	b=LrswN396ymxUQg2KthpHqM5dmri7L1NO4VPceG1d5Ymht8rthPZDfPXWo1YJoQdDE2Vl
	 I62UrvX0Qtu/J49jEotnpgkHmpkuvUsprQpymuluTEDorpxHPMZBJfsCjip/wbBTiYSHI
	 xqr1237jSGa3befKEt3cQz53Vho2Uq9SIqGt5CecPyVglchgaAu2F5iasFMF+EV/n1z+o
	 qZJffx67E7CXr70ekoL2259BZ6I5uQm/TCxUnn//LozRinFMlevS6M3SQliZnDs+WLQa8
	 YX4fZLoawfTnUoNIDIWPNlPrhY0NCYxtf7p3yWQA8IaQ4DM3xMce7clXYSwGWhkrhvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=ji8YvKUnqc3QlN3IMEkRMM13/1cufKSw6J6/E2JLJ8g=;
	b=K3WKsLzuznBBblGQNqAH4vQFopakLKsSMv5hFOj7oDbFHFRJEXJnwZ03NRo8fIVsAVu0
	 /ZWeHGdIYd9CS7FIqv/NHSRyvAkQhGGKKh5Ho4/qL5wnM98GUyePZ6+TQtjFoJUjlOD6z
	 t179KvSFFkrPQbxJ5Er/EuDaIe7NzRKkV7R/g4c4MwxvuEciT5EUX3OyDA9A9NHex2mPr
	 Cz60YzpT8fryUbwSImXK0Q2tyMAuNqywOhRfMdmajyIwPeKH9uYZnTLVUsC78guy/kDGM
	 jAm/LbPE59RGvzes2OilLDgIadyFR06dlKItLLOf7cIXbHHVcL12ryzDsaxXLrF1Bbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=p59gn6sn;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26663606A691
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26663606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=p59gn6sn
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b51389f58cso98082097b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890465; x=1796495265; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji8YvKUnqc3QlN3IMEkRMM13/1cufKSw6J6/E2JLJ8g=;
        b=p59gn6snDi4Z+USAirQGRE2djkuu81gHB+S1neXc2ZbGDGV3YZS3wA6wdtQHORvxTH
         Fxf5a02Ejwsem67qW8RClKwLaXfGiJ9Lkb3pdMIYD9U6sADBIPGITtCUyaXV8RU7/uIn
         BGWts8MnCjxhRfuM+vo+jAkzYkaO6uFNZhbHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890465; x=1796495265;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji8YvKUnqc3QlN3IMEkRMM13/1cufKSw6J6/E2JLJ8g=;
        b=vazRdORoHuSScabFEdWus/uPp+8Wymahax4sF7HByefcdHgp4qIJes92YJfHnNqxH/
         rshrDsckljYi9Iig2PlLvG1EPROePCaJPPM7wWzxnPaCw3Zfk3zqgCYP0Xo+t7eZDcxK
         EchucZG9TuS7dzc1fu0BP5zCBHZrYfTzJbk98tDPoMPncuV+3eeSu6GCDgi4Nvy5zsI+
         rtrvoJJR7gBAJX9YdyiA/8Dy9NsEMz+S5CLsv5BkI5F2GLOlo0iqGdfAogZ1FeECYw80
         4pW35BwE/a+MD6tz44/j6uO4Xf3RI3YZc6T3VHA/UPzugCHRU/EDXagpILe/RzPS4jvA
         9V6w==
X-Forwarded-Encrypted: i=1; AL+hErGSuaPS7q+89Cw8YnfxHPqh9ncM87DKmXsW0sfLnmyxRnUldIYLXy3nQzZKWe1BLCGQHvPvn/Aph67KT+EhFo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GthIX9KjzFJmI45MBo5jOpKMAraW18feprT6sLQvBvWH6VZ2k
	C6JI1YrDnHrpxGzWTFbiwvJ9U6wXUjPzX6Dd7eF+HU/AMEdTQg4SNn51tI1f1fd+2lo=
X-Gm-Gg: AZFdTZdfU1iut88Ruul6Ih5NB+Fp5YnNegiBkNAo1ceY8zQVULJwKeDW8jnD7iFTZWk
	z0n3yWytdtTyNsDlT+P9HsQdbwLsaYcmB6w1iDai9Ob2iY8/aVIK6vMdyHf2HBqPsOrIrsIIsls
	lfoXN4e9YJ+UPiIqjucpTO/zzTeUVM4jpbQ0p1TbxX1uXH3OxkOE/YagDqpGqy5ZeuBd90OZGXM
	jMV4ws5cIvUUv8FWJkigq8uOwT3IqlFTDzktYrxxpm1xLFhfk+gEzlLfq2Fisp8kRloWOGwOeEk
	2FWDdJXIZVqIqHQc8RMOmMBhGTI8dCU4yNxIk8QYRlR57rm2TcwFJK3hzGMs9f/0Z+pz/7hpBhB
	uQpBBz4kJfTVZRO+MHCjClpjK7e6BbxfdwY6j9EFo/o2s5ZtBYoA3wQeiwBNo032P5tOrm8ocqk
	Hbnyu3YPDoWXbVNrDJ2oCLwIZTC9A/1h1mlvB15AmJRHtZBicYzw7Ofo0NEr6Jr1EZc+dXVMtSF
	iumJPjC2svHnXVNHSUalraY6A346l1zpz7ssmgFMw1RsRlYY2GFGwq8e6bcC0ax8uJZ5foAtHqD
	81OUWXAgcNyzdw/Fq2CzvfZpMkFca7z/MX1BDg25/r0yFulLOBlcRwFpPQtK7uZaDGdgjRRyhm5
	MiEdZzGm0+Q02R0roY9dKYlFeOqvK/qzZn2qct0X4NoGQ/CV9WxU6Mr0pfCsa7W+muQdFholZGS
	jkDBifOpWNAZkzlXcPxHYs6QAfm1ka9TG4ed15jyzXjPYulUJ+/nrNLqPvdwoKNZ6dgkeL/zaGB
	OHM5f2DXyRBSSvoOS6Ey3o=
X-Received: by 2002:a05:690c:f05:b0:8b4:ddd4:d554 with SMTP id 00721157ae682-8b5204c5124mr96724677b3.65.1795890465281;
        Sat, 28 Nov 2026 10:27:45 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm2519488d50.3.2026.11.28.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:44 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:42 -0800
Message-ID: <3a8fbe6a8642b038635df1975ec4b77094049d64.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 6/7] liveupdate: Expose the sequence number for consecutive
 live updates
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Export LUO's live update sequence number, so that fleet monitoring can
compare hosts on their first live update with hosts that have been
through several.

We want this because some bugs, like memory corruption, may only show up
after several live updates in a row.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/ABI/testing/sysfs-class-misc-liveupdate | 9 +++++++++
 Documentation/userspace-api/liveupdate.rst            | 1 +
 kernel/liveupdate/luo_core.c                          | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
index 8c3814ee3d37..023961a42b29 100644
--- a/Documentation/ABI/testing/sysfs-class-misc-liveupdate
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -24,6 +24,15 @@ Description:	read only
 		the underlying KHO handover.
 Users:		system monitoring
 
+What:		/sys/class/misc/liveupdate/incoming/liveupdate_num
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		LUO sequence number passed by the previous kernel. Reads 0
+		if no LUO state was handed over, 1 after the first live
+		update in a sequence, and increments with each update.
+Users:		system monitoring
+
 What:		/sys/class/misc/liveupdate/incoming/sessions
 What:		/sys/class/misc/liveupdate/incoming/files
 Date:		Nov 2026
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index 39bbb91d0dd4..61c246371200 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -50,6 +50,7 @@ Monitoring
 
 Read ``/sys/class/misc/liveupdate/incoming/`` to monitor incoming
 sessions and file retrievals without opening ``/dev/liveupdate``.
+``liveupdate_num`` gives the LUO sequence number for the current boot.
 See Documentation/ABI/testing/sysfs-class-misc-liveupdate for the sysfs ABI.
 
 See Also
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index ba174e9aae03..3ca7b3875247 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -441,6 +441,13 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(state);
 
+static ssize_t liveupdate_num_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", luo_global.liveupdate_num);
+}
+static DEVICE_ATTR_RO(liveupdate_num);
+
 #define LUO_INCOMING_ATTR_RO(_name)					\
 static ssize_t _name##_show(struct device *dev,				\
 			    struct device_attribute *attr, char *buf)	\
@@ -458,6 +465,7 @@ LUO_INCOMING_ATTR_RO(files_dropped);
 
 static struct attribute *luo_incoming_attrs[] = {
 	&dev_attr_state.attr,
+	&dev_attr_liveupdate_num.attr,
 	&dev_attr_sessions.attr,
 	&dev_attr_files.attr,
 	&dev_attr_files_retrieved.attr,
-- 
2.56.1

