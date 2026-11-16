Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792794;
	b=y4BnAVHC3pM33syUWSMnbTnjNIT1igNlrwrMducPDbfF3Cv6DwvDlceljd7p0hKiGy7F
	 pXFLHbGO3d6lSYCFLOTjTcycBGUfITxOWzZU/te5TbsSiyNC/ZrwE7iOsh0hqgDrgETm+
	 I51cpbXSBmMxpKsc7PGgvU3SnQctQv2wFLEZ5+DOalvCEiiLd7hPN2KrkyUKKFxVoZ4iR
	 AxMYrfKwdDJBxW7qXC7vy4pSxJ+0sT85N54BwUQUOzwkHk/OECTrR1qwgLt35WUMk8k2s
	 ICbVslQa/vQdHZLLWgR2weQtXLFG3zXSDnK/tYyuc0Z16CJJRK3JjF+u3Hr8yYlEq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
	b=3g+0wcweDT9YcTc2OLan2FeOWeSr6cj6sF4A9SAJ275fGYbtYSSF37t2giemXGvgnx5P
	 hj59MtrMVM9Qfhbq+XWvwYtKqGamo3QV68ZEtziObdcgvZ28zqV9ow/pU3cgJWl24V1B2
	 T2fp8c/eDuJsVli8hoGu+eXiBlGx6AeDmzuhq1I1GtKeedMzG4DZH/2KstZBEjyKFq8Sy
	 OMOAUj1kBkVvCh8bTA6DyWOnW4ZXG9vkyS9W2vYX/iURravIwtbMSXxksVNU5+rJ5aIr0
	 m8+5msXclfwNhIsvpsdFKkJG60bQwWi95u446E79uLykxKA2U41jyRlSDdHhApQm6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw0HoDUf;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186EC606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 01:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw0HoDUf
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso3763793c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 17:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792793; x=1795397593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
        b=cw0HoDUfoAqu2yoQ9RI82TKU+nd16dXnFK2QISB+XAAWbrvtn/fS9OJvxJ3dRLnvf9
         uvv5dM5vbEaNIDEidyFoeP2ckF7EwgfHfNPlz7R9PDej8aL4kNq7iKxkCAkAno+cMKUA
         pV+zjGnEwfvpXSATX6lVxnWGvXVuFVUitpJO5wCTLujHvKnfAasKo9JCa4hVuAYyg21I
         7P1+fAP8t6Y1wPwfafIlpj6XBC4BJcqr3T1pfjbRcJjHS1qcewZQqBNCO+KNYhnrUni5
         JE63uHdr+tBqRem8wrXS16P1bc+EvKBZYTF09JWzDAUtNVPvZNqjwv3AFre/7A6vX/Sa
         Ntqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792793; x=1795397593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
        b=GcDok5xwRFfGaWHU0NuEOzGRgDwxLZZA8cXTVnUjeJHQF9UVAse8dZRg209kXra8BI
         uqaVKOA32WhaAMdTe3DPYZ+ImvwjdJZrDOADS5Z7oVX4i355RVzifQEod8XeaK5ze1Y8
         fJYzWqQff7FqC5B38mrtAVpz+c+V/N04V24FHilwJqCtFDoNqg0bqttpwf2A7KZpeKXi
         3moouDk3dB2roexKqqbMCrHeLHIz9VU1zxbv7keda3Q6Skz8++mA8vUAhURbzKD2sg3h
         f4rGVzjwJ+Iti1FNjmk+nZl2Pf11XH0XkFKLGMZSGwwvlG427e9uNcGSh0g8ruCpUXMr
         0ICw==
X-Forwarded-Encrypted: i=1; AL+hErH1AQYHPsoMU7kD8f4bN2IXhIWYjNlIeBiqKwpow0rEaPjeQCYRVLEqdjnk6Cfvw6746m9FMDOeNiU6LuyzXrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sagy2IsT+2R2t8KZsDGND9LtRXcpE5SwSDcsgVFM5vx9w07cq
	JXawjUB/PIssPoBxiEzUN6X8ntht5gfcSOLHxXIjMGuf+Ik0gHkbg4HH
X-Gm-Gg: AYBFou0hxfM0h2a3VDgAHerxAF5HvwdOC34X8xg8hWzhEXHMeR9EpbKeko+2oNnF68V
	Z3P9oMncjXr18KIFmKUaNLJlqMwEki1pOM7ai4TmwOMo3wVbUFlTBoJ6LliB4HVWho5RwrRSfB6
	9jAvQA4o7gwFmCBA1Vl4fUPvzWrdD83kMY8n18kx0CSsq5ZMmj/CnaXGMXUUvP8uO/549OsRYQA
	AQ6yK0+gKspP83akC2CRm5t7nXndzJZm/jUZajrNWTp1FMoyJlEQkCdIP+VPGWn5arQQjaLuhZz
	jUz2zG+z4Mr6QhctomEpGrKAoyyXlpxhd1w7tgQHQE0r5uaXLPFGF/FkFn3TNq/97ZXSO+sSV/m
	TRCXVmEIGtuddB3j4sLwPCl1BPW1Y4BQbRX6WZXtY7FkfPQ5gkFYhkQk7JDJ2Qrslb3Gvc5dI5s
	jI6zrAokAgruYWaaJOpefn4NsBedqFM2KOQonUSLMc0EJ+bzTcToHELTWyZjlPEr3bH7HfH7Ytw
	ut5ljh4Elk8z4o3PyAPo9+BZ2Qeq/xuGs5F3APSpQ72rZNtGTiuqDilADxzVTiC2U2KTL5mcQD7
	HIHexb1nxqUkFU/7E4sGHcThvw==
X-Received: by 2002:a05:7300:f694:b0:375:fb27:2c59 with SMTP id 5a478bee46e88-37966c4a50emr14872296eec.20.1794792793084;
        Sun, 15 Nov 2026 17:33:13 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm35309648eec.27.2026.11.15.17.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:33:12 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sun, 15 Nov 2026 20:32:59 -0500
Message-ID: <20261116013259.205882-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179477355840.3291.10898450599671542519@kernel.org>
References: <179477355840.3291.10898450599671542519@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bug turned up while I was writing the YNL spec for this family and
had to say what ovs_dp_change() does. The function records the new
features before the per-cpu-pids check can fail the request. A failed
request then leaves the features claiming a bit whose reference count
was never taken. Nothing triggered it in the field.

The second patch shows it happening. A set with an empty per-cpu-pids
fails with EINVAL, and on a kernel without the fix the datapath reports
the features the rejected request asked for. I ran the openvswitch
selftest suite both ways, failing on 7.2.13 and passing on 7.4.0-rc2
with the fix, in a virtual machine rather than on hardware.
