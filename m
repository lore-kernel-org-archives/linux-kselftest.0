Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383626;
	b=iWCbXdBrSZfpjOctU/gRjGFgjs/o+C0unRg3Rp1s3nvABCgjOH3upA41aMvhh2SN8Nzk
	 RlBaAck5pjdNEqLEUHYvPvGgElhfWJa4hUULrfIylMh1Z3nZkn5f8/rgdr0p7N3vaMSzq
	 xz3EZss1QnH6P09eq3+Ab6rsH3ipxwU0IYv2IdblGGHwp6O34CzqNVCqPdrKyiMyAUdjp
	 k3ZoS8AHhq/WaFU+Wf8cTBfQNfhHyrPHexPPjl5ttOU+7cUYRHqqE9wXYOvY6ekxdF3gH
	 69fYHsDxAWyz9Nill+o/lkr+opoijmxg6lsVdCBk2HPd2Xk40lAP28L3JKxdMaxqVyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
	b=rC61Zu3zXD0vD9gqyUqp87zzdxpxiCjBzkMOhcRRdE8PUZnjvo5bE6qHgpBTS9e4PWpA
	 0BZrnr/kWwzA2tGYNOqCBEPhoYoF52pAVoofzzKielH7KaiSGQ2wevxY5tUy2/fDFkLbH
	 8SpneFEs1RVEX2NaYP+FsjtLc5JLZCMshIp/u3ru1CRZMhoXb7Zs2wuNCbUiTSYlNTgji
	 xvkqsnSP1GnlDaNgYsB9T1nTSnZDELv6ct/c25WwX3tXzEW4+hWnzeMLTwDX4Cp09hq6J
	 dUNCZ2+Ul27cnEqMGFyKX0u9MarW5hKNw+z+i4sZIh5djCdYglBoCTT4VK+ogwAjXuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79D606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E79D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22217475e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383624; x=1794988424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=c2OEhHvmER3+RZdFGbo6s/3sc/wn863f4xlIqCDTNcNCkBfkQMKkhrp9MIDIJdMHJ5
         gn5vAGI08jqoP/CuW2e9fdcilkN78XuU1mWqLv9aEgCHB/Mw4dz+qMVHvd5kxhmAq7Xe
         WQnWwjfTwZpAILgiIKAhoBJn8CwuHQ+7Z6CmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383624; x=1794988424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=k+4RnvwREoKX6xnt+hKNatjqHlm6OOZRKz1krCS2fJBxUnoGvi7GZWflalj29G4k6O
         FaoaJr7ZG8wMebJQWeKIS18jRg689Z46IIz7n6WoI5SWLzfq/4YLgLfcvxhUxmXZl4Rs
         cQ4HWOr1U4EjYwTSHqPNSx5SZTlc+Isx4S0HVFAqbDx7y6CO4T4Kws0oCPIQFqc1l7+R
         DRUpjRG0bCMTpYHN8TSOs56uL7bhEK2dS3OlioPtAtFb7CiWVdTM6LfWBui1M7qvti9m
         UXRzjAY4Wi5OlQUYomzedn13vJz71JA1YQr+HehSkSxab6lboI0AoqFH5hUmGc+/Gd1E
         yjyQ==
X-Forwarded-Encrypted: i=1; AL+hErFVoAEQFWr4YlXQ9V00oH6cW9aKSXDmIIYd8aKLra8wU3J6vbH12W7/WDdTXYknnXSvnx1WlJNJjTUSmK4Vajk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OqI+UWxNMuW78DUqcSuils2Vx0C/p7I3x++F4UYFVNMbDg7Kx
	9qXQeTzUa/bot3LtdTlrlR5ukCESGy9m5bS4f6pWb21oEn930ncFm/Pmug9UpRtQxas=
X-Gm-Gg: AYBFou3qcVBoOIY6bOsZ8/24ed+YB9POx5G2ENoLezBWv5LF7SzDaFXRaYzWWoTP/FF
	ziyUttIdBeTPAeRHQFpTKP8Ub2HV+fDsr9puM9HALrLQDZVssXwV9ZSBYMpTm92A2Qp83uUI1AE
	YNWFy8L1b5y6YLb9dlUK74f8GRKirjUUQUgpcGCBe9lID8Gy1u7cYfenA3oi8J2xunU+ZZRdbIj
	8jhRw3E578503Mete3W6GzY5oum8U2Olf5ognFLK1aPncZYL/gHceuFq2cBfCiOADewbMDl98xf
	+HMofeYZLUDHS5Tiej/C1iykNfSKeBLHrCaQFiQSeuFq+3YYwRyqs4mYPwgNPe3dZhSC4u39vQg
	s73oQHcBaqRdgc4QKYhbZpNpXn3KgEkWykjHTxk29ZrMU9MpCI1q4o2b0mNVSn2UCxqCrTH1O8O
	dJuzpsQhfqRkylGoGv3DqmHSLCD0FdFWaxpqEEqcVubymZPXqbLrrEHHxINmY7A0XttyGHAvCKp
	uuISacTsG+0tCexcAcnBT/eT31aJOY9Wc25DzjRxymB7NAAHbgWRaoPxS7PnWrsYn9VQam0O86o
	MY+l/aOlHf0oAtswLWt1zjCOKvof0FO4i5H+ktBOWCGXJWx2y50/4lWVKLdzc3jBpyUzIjvmfat
	Ytuduxm7+f90+Ozx7F5xaqD8AxVRc+/0HKrHxDONe62clVcwJbceWYUAOk08E+o60AOrA/+766R
	dXZP/c2znYD8BdhvsL6Tsq4PEcPniIFVx7WLAlb4I+nJaJFCX8SZmo
X-Received: by 2002:a05:600c:a00d:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ba093acadfmr26469595e9.34.1794383624548;
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm138135715e9.15.2026.11.10.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 8/9] liveupdate: Expose the sequence number for consecutive
 live updates
Message-ID: <6f10302874805eccc3960531194c989cdd1588c4.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

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
index 608f788ef0fa..b0ba0f626793 100644
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
2.54.0

