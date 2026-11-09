Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228496;
	b=VWfJNFTGTr5asTM+qwoItMiFqphTeNyGfn8lf1CkAJ/+UKRWuonhP/Vs5HyDkr7Sbqoi
	 BtxKxjFmWmhbSISDQcKy5qECjvoidlP7eS0AXcxX98c2tYmFyHiXY4mdQdKNmAYqS/X8B
	 Vf44Jgkf9HYno7xjvp1yGK42TKOePRUivcJieIb9n7B2xnpK4U2AD0WP1i01Il068gNKC
	 oJ+ElTzdWzc3i4oi1SY2tkDpfsYa9ILVEdDj6NknqKXFjfMqp60MjQr+2s3h3xmGyf+GO
	 xlb+tO9G/gUe6C6B+SwK3Bhjl15wRdYXgPf858Z5dW8mR3IVX3NsymHJTEi80w9q3qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
	b=AGLID5vypzdPfkU7jnhCjWsyVxAlb7LW1XJl+cRgyi6jCkndPRAyi8DPV60zIalWV9zC
	 oSDuINPeFFEF/MDvHPm8lZULjIKvrP82eYi0TP0Zfc5/oSJR1OWIm1M5CssVwMahI6GND
	 AnAgGKvcf8VeLU1FcHoR3uZ9YZ5/ojyPecI5uN4bDV7z+MF7VW+FwZqIjTQa8Nh8om/90
	 fEwfS56WZsQe/BNIo7QDT2Ag2+Xddx5JvOjAsiUx2N+7CwctaV2Pprcf2JA6dw0jmXdbw
	 SR9PT43DyOBLPMUvTscuCJwbNTLJfb/7B99XGUktTDi+DBQJ+kCbxm3tA1/+BE9l5+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF05606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIw6kd0S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uipl3600417
	for <linux-kselftest@vger.kernel.org>; Mon, 9 Nov 2026 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=; b=Rz1cNzNq172Tkyx5
	gITH2LVZb1HIq8a89fhb7tq14z3Nn5M/IYXPCpuCCQAMulaDcXbKlTyVvp//Vl2U
	JJoR+aL7RfEIZZ+NkewMCWT7AgaCm/5qEFndmkyn/5nqMMrZqnyjRcjW10IfXo0y
	AtyJnHJnm1BcH9RKhZwLQpnI92amlxy+ArwfviWTtS5UfC65xQjF1rJSEXyk4rR3
	XsKxQM+6Okzdzuu+Eckc5ezElKnF+hYuPLPjg4JUPElSREEvk9p+GJ6icJt40Spu
	hra/rRJtR+mIAoHxfmf+7MqaOro6VgIPzZFXEfXgqzuOZyL+t1rD6jARU2N6lsLS
	FiFFbA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5890uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:48:15 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b346e49674so12911927b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228494; x=1794833294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=BIw6kd0StHfoLi7OEAyBRrBkoqNL8ilZVvFwullkQLla3LaVMXUooCOqfE9bi+ySBz
         TpiA7IxG8z+A6eJ14J6/xcOv4y+mNI40lHqKV+vyqq9i16997Yv8dkcjmnbFkOONNjdo
         CeQmZVTWkvC79hRhwNkdRtu3UncHlp7PWi7wWNdyL1n5ye1lpgWY5zwM4MsxggNEtqlY
         A+opcUR7fYu5knU7yQZPlzZbfiBXdPJnu46Nlm+NMZNHZO8vgxYPid4X2CkQbq2FIy6a
         EE5+QneoD3Uw3yIHOdH1NlxvMRy/6QV8mrMcx7VCfkhXFH8hLwj68MixHmzrvdN5a1/I
         FTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228494; x=1794833294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=MydJaqec4HE/J07A9OvFIqQDsS+mP4OfxJ+LWAbIENBU7eZrIFb8m8/1Lrq3lNDonX
         N23aJcNniNu0+waQI0U3Q7pBIXm7Q8NGcn5rtjGHyrdUzO/3oeM7QIu6Am9OW7SwVAaz
         Z1jQ42IVSZDX8CaZD+OwCKHhJQ5j2LMoTQkOvwHibkP+06PHaicTxab0OgLsi5QSi+9+
         Z7nBAeukzrDtMrWHORfIB4O7Ayi4LF7Rdvx/J7DE7xJ4aZzcwAEEv2svPi/rAe8sJT3K
         r4QPQvaaAPzvPBN3n4snlPQnY47go99qIx3wE5GTbzKG2EjOS75tu2vESG5jxW6Y4DqI
         hpiA==
X-Forwarded-Encrypted: i=1; AL+hErH+j+pXya7zlvelyS3xijhntylfknRKrKTHWe8zgWm1k61/p0EKoimtll4Qg+EzRCkSkNrwGDEHI46K1EqskKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rij0YI7bc0cMFyS9ZZVwwwjgNuSA+O3ucs47xi4hxhYT8m3Os
	laDYlWMGNcdr/4OtM2RAzsssOXL4fDUQyH/H/8VSiX0GQ2b389SyH6xoySckzuvR91Rx7UlCdPg
	ua+8RKmQdo2z/OUFHqkdATFq/HKuHeik8ZJeoYOidXKF/20xQLwMHIpwSdHZvdgAb9Si5TAQ=
X-Gm-Gg: AYBFou25WE7zI2LYCVfDpShQYpl+3lRCAezvYMrxrmOURaSGxvUP2s5Ex2S6YpUQ1ta
	sDulXv3Jnjje3qkzgSm9lbjISnjLj6fN6XC/3nWae5BDiH7gu3Z/eJbYlD0052q1yEdhTY19dLU
	I2VL/i0qBgJEHmDFLc/6gopyeUTJCm6qmQblR5PwxSJU69Kz464eEnBid7kHgSQYCOTBM9KH2Ul
	QzOf7hP5B5XKn8ZDaETmAybUlztU0JcdNyoXfN/4xZxm1al85XLpjPkPC62nPbANXtQ7rR/BrD8
	LcG2AWDcfClirgBzh6+B8Osa4ao9C+D4YhnB5TwpkJAYNfcjcDOep6UxsczaChak45oTOk6KvuL
	AIbhY0rq/Og32AzrtR5ER2/ddHNEbSqAO0EddZHV2JbNH8+dSVGYRsTajCs8FBRJ16kxRH8QODc
	sgOzoBPzWWIA==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253577b3.17.1794228494293;
        Mon, 09 Nov 2026 04:48:14 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253337b3.17.1794228493700;
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63209asm34191627b3.6.2026.11.09.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:37 -0500
Subject: [PATCH v9 4/4] riscv: hwprobe: Document that keys describe the
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-4-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
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
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=E7QUgZlB4TXvJCfVy01ud6KHHfflRvYJVHUOIS1HhZw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB95MCqjkXT7f1F5As0JPn+nSzu0TmMq7j8RtO+uZ4
 CcrNl2so5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACbi+52R4Vfh+qMzOLlZZlT4
 BW973ZOjesY7RvPg8S92e1a85Xkm9pmRYdXek9p1TFoP3qx6wiRsW3Bu5ovZauunM1WICZpue54
 ZwQgA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX+5Tbl+ectTEM
 SnytYvCml52dzhg6yv/Grk94sxj4znw5ndHzWx1nOPT3SVeE0DJrkZ7ykt6Q9vMj09mNqDRb5Ic
 4g+l0lpv/megwEq/k6F4+hgUiLExe6S3sCxBNPka/rH53f7xwarjOAi6A8s1ubnlWNdootc0e7o
 nEignm7vvE/8FXfOETZ2KxzOwaI4rlHLhEarCH5YpGQmDZ217tEAN15NNE4eXiq+CB9GjoJL96C
 cKb6f4RkyiO39KzDPEWrmJgLWGfOyUNtit9PuY9Q7DprYHM4+qZ5p4pDLxJAxKGx9quOqgyjYyF
 +OADET9ROSfaUGh9p79raCMhzPSEPUfFRbBf/hIMUist6NvHWMfSDKAryZr7qFbg6NynZOkckI6
 NQLloB1CnunlqivjfRl17WzPX9K4BI/eXVKY00R/7IUbu9j5mC7fyyuzeL5iIENNv2jrZ1QwMjw
 2il4hNZ1OH4AHgzwpbg==
X-Proofpoint-ORIG-GUID: 1_vKyf4fersNSyI_GyLQyjzC_9JCP1KN
X-Proofpoint-GUID: 1_vKyf4fersNSyI_GyLQyjzC_9JCP1KN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX95A9t5/5eI29
 wXNJl2aM6jh7ujiCZ38GoMUjGgWHZTPENenbXm+mcKzaG4mjUbIVK3VDFwnGwsTCL6VR7W/RSMA
 VDeCQoesxH0ip6qw97j8bHANlfoyrlw=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1c10f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

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
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c4..30dbbbc27477 100644
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

