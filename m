Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728803;
	b=fOCNtfIeUcTBPYwABoXxCOm+mwML1ui3JBJrBb0zsPsZTiEV/hm80MlJ9Eh4BNdVBGFU
	 A5lR+nz7AlrtRywvUXpnlUsoqcVLtOCn9NTQQV+r5VG5YdkrAg+CbBxf9XafsxPAMdRcn
	 up1mLDub8j2OQi9hWwKu81D33GYYfBNfUBOQueI8JnvKIk1FBuXu86i7TsHiYLIdtior6
	 R6UdxgdYPTkudtdt8N7gOfcP6GtnEaE/Xxl6SIW2N426gnaYer6W6QyOa/0FAznS0o4Cy
	 QLW9IR97kVGkHJMX7SA7/OQU8JuxWVcye0edEIQYCI1rGGt7FbNxmZxOtIxdMnslCjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=;
	b=L3p5dzJYMAq3SaxUuHKZi8PzYbEr591c9u5+7KtaqtjiZ9AhNC8G9xwyDeExI7VARLww
	 8IolfwOpkld/joiH0cEQw6OuSPtkv9bBemsKONQpsysj9CqUpmg877zQ1+b3DJP8e6C3Y
	 AlM80pBHrWz0gqBpeNTwkcbmfRUB1d+JQX/8F+Gjd9MIoiKxo9dn4y4kS2tvAYb+XsezL
	 BS4L9Jf8y9Or9rXKRefGunSim05FfPPNBwz3NtuEBi8MCvgjRZnfiPkLutPn4nBfOA4tL
	 V//O2V7wn6Lh3BxYqQi1UVlIB/4Q5bPtXzkjVvQxrHjfdo6drLJdwmJWYnMilADwi3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+awMMLl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSC0FQPE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70477606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70477606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+awMMLl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSC0FQPE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwGss2354425
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=; b=F+awMMLlOojHpyBU
	DqwGNxhurppJie9EXst1C9Rwe+Ej8IU1yayGd+DwKDvnzirtMhn258sUw9GnI75E
	XiHS8GWSD1jeh1HgKobMM5B3LPr/t6lFchFaDxuHUWsgVOqWVTQAPFfL3pgNLWO/
	aHor43V5qaEdmd0hXhRjHKWTA63DpctRgVvajhcitJ6vU510rFRujl9ZtKsMBNFN
	1EH7erzLMascdyEgQB2Fs8SmzRRrOc8b+K2nhazr4IE0bDAQB8rcrkLx2cTIw/Wu
	Gv5vkU15sChBCnfn/8w8a9BjpVQAMbXDzJWpvvPbOcSdECFmMQ0Vtml/fb3K7Dln
	vL2fiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7ttsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f053f9631cso87329805ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728801; x=1796333601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=;
        b=jSC0FQPEiO9oTLoA3/jSmH/INy4XJLxz8XrtXZ3dwpVZODBtJgOj9VzMlX5lqqCvEy
         vZ8Eze9UFe6Bnm8xqzKhHL1qErFQqPUA02XTvAQBN06zc129evX8sYuns0wfUtANPNBT
         Z0HWC1HucEdoaulVQ5urY4ahQUGRiVgntNz6TiS78E1BFMckXwWFgZW1zkjc4bOWN6uy
         Bs7O7C8IxDaQVkrn0YgdL3DKxrgb4dfQvprw8rKQah7A+o164aLlyzJX8Yv0HqjyDgrf
         AODj/lCzyzgZLWzqdx4723pUpcztcFhgvolggMjr1oBMtZvlFMLAIKT+aSVt+T8bQLPc
         9lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728801; x=1796333601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=;
        b=kw4fIWAgXUh1coPb3/WjUBKbfp8+Iu9x1pYZYqFou8Yh6vJ1EuunPF7XqMwAKuyUv0
         6USM9i/5Ycvq1RI2aqXVWqQ+mK2Bmxj/5ua9TN5+c4vvct/v9l0Ztvc4uuOYplhc5ju9
         L19SI8bzaxSmgBwcnDqEEpBQBO0rLyhNjsmUdyr2AV2zIWwMEMS5Q/inUsqJ1ByPr10W
         BBDXaddxIjXqacz04lRJKt05M4QO3ajVEeD3jSZIlABWoCce8jVcpx/dMabaylNL8Nze
         xBTcdbDEkLC3ZuQukYCWGNdkcSFhRJtUTVfNMJsGh/ieSeDa5TVZsFTeeUyHHcC28KiM
         YuNw==
X-Forwarded-Encrypted: i=1; AL+hErEn+dmO80mI+q2BJQBzQtlvvISKAfQSzC7vIXmjz7HkVWVqyXFycWG3hVRYyS/bQ6n7UtEjC68mlxQACMQ+dmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sy7uFAiQcArLFkFmOMmJ3CxWk9o4S5Y1BjKltLDe+PZ1IKyJE
	5Ztqj3F3WmRJN2cbXCzr9LvWwq49hXSLy3sn/iDQaXhY8NfBYsQ+FbgEFGugYfJjfKyP+H9CSmo
	vGTCX6lE6mnubZTLL99JrB/EdSy4da2QbuKc41GWDst8LztGVIMiGlh5eq0uuLNbWqdxNNlc=
X-Gm-Gg: AZFdTZfQsujb3geLJT1P79aoSxQsWwLKipPyKruSpOUQFwlMiDXN6OfG3OGkfGUMkd9
	ZvGbL77QyfMntUVSQy8BvzopfJvSlWdiXOWJ7322fd71h1RSqF0yd8/VcX3hMKu8jn8AyxLWqwm
	FtEvt1rshmEZotlXBcZgUVyEWYZsDwf1KUtVH+esJkscj7neyiEeGZbWtUsIfkAaaCjFg4LEcA5
	pXstLUYEj/ZHE65hamHa0WWATodKG5UyzlVU1JgJNTpx56FTKLV2mjcl1n2Der0xJgSG9T5RNEb
	sk6T+bi6Q9gBNI/lCGexy7v97Q2fRXDC9amG2d8GkLq9GPVm+SVsdcVqzQE5bgZ/ika6R1Wm5Wo
	+VFmjoMOCUHln1Z3XEsyEeaog4xjaZV9vAJ8b5AroUwtTb3+tVTvOilqmIwlDK8Ahj2rnel56kv
	MnGroExHR4pQ==
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr246268845ad.2.1795728801160;
        Thu, 26 Nov 2026 13:33:21 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr246268485ad.2.1795728800553;
        Thu, 26 Nov 2026 13:33:20 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm111306815ad.1.2026.11.26.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:20 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:32 -0500
Subject: [PATCH v10 4/4] riscv: hwprobe: Document that keys describe the
 user-mode environment
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-4-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>, Icenowy Zheng <uwu@icenowy.me>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=FWThD962kiFvT6EJsGU+cOr4UlRTXPFc45KyAkIoAXY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpdUx6z07rrsY7P0WomvEe5e9Q+rWxd8hrwtDfKfd1
 LMzOXqho5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZyI5iR4W7FS4VzJmKCy8+Z
 hDjMc/0fLa0u87Y73FImLelH6I5uRUaGNWrHfl3IzXjgvk/4jhJT5YWZJx9oztgcZCgY+uIi158
 NTAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX+6AgLrbw7Ail
 4HNQneiAbiGP7sZ+WwxQSddZP3MXtDFPLFQVmh4YIiiO+znbnF76kge+3loYlvPebbWeZBwOlHK
 6JDdoQWagluxFfH4G1uhm4WwdHPv7gw=
X-Proofpoint-GUID: ONgT1sw-hP1_tfwEPfRc0mffwr7MlDlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX26HgT8S179LZ
 HzMQfVfMJ98l/Oo8zHHlrGKBnDUVZgJS4gj7Epn1ZKMqmi/lmx1tW2BAl5F6BmPEMOAohatp30M
 dfIigWXsljhW5ytnw2jeNRBdmONLawiMDRzVTl+dXyHw9sX+XPYkNf4uIJglO09WF7ajXv/bimL
 u5A5z9LO+5+/zQPLUUHVKMB9rJIP2mh4RCZlg6Sq2KKl3+/VHN3gHuAn/isLSb3gnPDmBRE6qi7
 Q0o5B8T3BxVNUH7/h8GYIDMqJUpKZh02t3Yv/hPS1+587aXE8OC36PV/ouCMI0/EnDWiX08/V0P
 mt01ExyG2LzBrLDyQ54aiUFew+1GyVVZU33IdvD+UMJT99y7UgiNixlZ3Patdu1GSTwoG/Di92d
 vBs1RjgBOX4IdbbGvwReGl6SnqO+38YoM9IvP1AdGgwbWRzkiMEYk7w310VTLsayPaAmAC6I42Z
 DPz+cgY0F6Izb9blIEA==
X-Proofpoint-ORIG-GUID: ONgT1sw-hP1_tfwEPfRc0mffwr7MlDlI
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08a5a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260084

Every extension key in hwprobe.rst says the extension "is supported",
which leaves open whether hwprobe answers "does the hardware implement
it" or "can user mode use it".  The two differ for extensions that need
a higher-privilege enable, such as F, D, V, Zicbom, Zicboz and Supm.

sys_hwprobe.c already gives the second answer for IMA_FD and IMA_V, and
the "do not report disabled extensions" fixes [1] bring the remaining
keys to the same reading.  The base behavior keys inherit it, as
discussed with Radim on v8 [2]: a base behavior is only usable when
every extension in its set is.

State the rule once, in a note before the key list, instead of
rewording every per-key "is supported".

Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [1]
Link: https://lore.kernel.org/linux-riscv/DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com/ [2]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10: No change.
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c43..30dbbbc274775 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -45,6 +45,27 @@ On success 0 is returned, on failure a negative error code is returned.
 
 The following keys are defined:
 
+.. note::
+   The base behavior and extension keys,
+   :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1` and the
+   ``RISCV_HWPROBE_KEY_VENDOR_EXT_*`` keys, describe the execution
+   environment the kernel provides to user mode, not the hardware as
+   such.  An extension bit is set only when user-mode code can use the
+   extension on the selected CPUs: it is implemented, and the kernel
+   either has set any higher-privilege enable it controls (for example
+   in ``sstatus`` or ``senvcfg``) or leaves that choice to the user, as
+   with Zicfilp and Zicfiss.  An extension the hardware implements but
+   the kernel does not make available to user mode, whether because of
+   the kernel configuration, a boot parameter, or because not every
+   hart implements it, is not reported.  Conversely, an extension user
+   mode has turned off for itself is still reported: the keys describe
+   what is available to user mode, not the current state of the calling
+   task.  A base behavior bit is set only when every mandatory
+   extension of that base is usable in this sense.  "Supported" in the
+   descriptions of these keys is to be read accordingly.
+
 * :c:macro:`RISCV_HWPROBE_KEY_MVENDORID`: Contains the value of ``mvendorid``,
   as defined by the RISC-V privileged architecture specification.
 

-- 
2.43.0

