Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141336;
	b=LhThgwaXF/jfHuZVjxaisysD/6DjlhwzzXe3uqaYeyF7McW1G5c2ztsPDAaaj9DKY7Cm
	 qvrZvQlD1ArETTbeiBD6Md2yGKLfofkBiYfP3HcNn1NdGZKx418gBmkjtcXbgBIVdpd75
	 nE6tVNn9PPAAxKmQgZTflkRiqigQ43G5xQR5c6n4KPZDQKWnec2ZKpbbBXWk12ucBI2wN
	 5kpNuJJb3yglwtiI/dO3PJdJnfuFRhYlGc1fnDR+wJL1qAbPdyTLAxNTJg+Eo+VkOBuLJ
	 IW/CAt+zVC5Ihq+5s7H293b/7n3XRkhMKTaQhGi3OQ4V6EnK+6vxQMZkS68xnOqykVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PI3mxdu/F4E99n2vbtGBdOsTP2HHkJVPSsEC8stKuJQ=;
	b=y9aQ/ssG6JLeupPx7QDzerBM8m4SK4jFHLlG6Hn6VwFI3Y4PvqaNV0BO6pKe+Vtnjj0D
	 LMsnEh3h087aULwdtKBznprTJWgrbLMkw7Z7VVT/+5LWdnfTzNehXR53ZvGt+r7XQPLVp
	 eFpTRmTzYtSCCc1PTJLUGfHEdx8f145pgdUsHfbIZsK8lOSw/djBj/9UnofycIGwsrG9y
	 mABHaZSdU3FLV0dKUZM3eY5tk8fD+FprjRiYqm6ERIqnTUdeoW0+oPOQkSahecmqCyk3V
	 bhGugzX4j2DYfMSKOoWlmKuWfjFtDxqAIM3dgsNcry20v5VT/hPE6xIcyFlXNzahdfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFFtM+Q+;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC02606A321
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 12:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFFtM+Q+
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be6030c9fso18078d50.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141335; x=1794746135; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PI3mxdu/F4E99n2vbtGBdOsTP2HHkJVPSsEC8stKuJQ=;
        b=aFFtM+Q+ywj7/wRJUg9KitjHUvOiVx7dsT2zTDfuKY4O4Y5zq2zNpffTnPQPmH1/Be
         L5Rg3GJ6lrjtXaHtRu4lfkNgFe+vQ3kOXvzMF9Apf/C1u14YTIdTForRpX30H39leAZ+
         AE4Z+A+r/K/VXavRXo4tFokWMhx8ajEhAeXkx4P8CogQBSQSuqaZmjBj39eW8Dil3x/P
         8IO30JSVlBqoXKsVn8P3jSLpGkww44H2n3T6GsJ1s21hCB9hfEcmguGJkspReTUFBWbe
         5SsEAiF5HJlIFq4UBzUK1Y7grY8kNdNlt/PHE09pQHsE1nDHLZQUpPfOqYu+1Fpa4Ze7
         RZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141335; x=1794746135;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PI3mxdu/F4E99n2vbtGBdOsTP2HHkJVPSsEC8stKuJQ=;
        b=Wfu892ZluxrTGzASwg5Lwzq4XETjWjyL5eTjGnCpi3udpv6UAxl+v+9C2nfZIbBMCz
         /L3cmkkly9k+IvKMzwp7SUTsH1X5O9HWvWPzM0PThmTn3cjR4pOtZLtve9XjPY9S/Le5
         HQZjPRDXf7yjPd7J2wiXjRJGOUPSuPU0ldfbuI5v7o9ftLEPJ49gRIj5CwmnSmfHvR4/
         M0hsPpDCW50he+SrxBtILxlN1mC+8YNqMsq7uW8sifAhBDzTGoScQuK5/DV4za4m8I1f
         ySOMtlPxNzlXRpKwW054+tgNB6Q68n1+ugN+zx3rUl1gpUk4IEOS1wnS6qT+WsjYZrPU
         k5SQ==
X-Forwarded-Encrypted: i=1; AL+hErEXGe0lgi7tkbxE54RC+/nUf7VHiOYZbkEgcQObRlBQdfEuengLqLBq/qBccNM90PA5yGAGwmYmv8HjZoxhl2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dizqqwhqsXOdX1mSWiLl1IEVa0aAAB5pXeEQINxvFr0GhPBHS
	JcMmxZMfxvVuIbnsLrsXsk/j3LMk0fFarIoCqx69zn/3KuvBsM5LzbOf
X-Gm-Gg: AYBFou3ZDMSYM/kmFVNTMhpsKLORAkC2lVql1jX5tkscC/LVz5vFxqKEkzOP2/a3PkM
	gTlOib8WmAeWX633TI4AyZWN4CzpdaHdR+d8w9vQaUHXTtdp6vBB0452BAQNJeLAe0ICyfu3dKe
	jAIMx3HVCMjGlkAIC25gRQMqgBdiclaTK5AZPEYT7O2Siljh4v+8U2yX80VkYe1feUYErdmYRWV
	NnYpqwpGPZCu3yfU27nRu9GiITYguj1aZskJkyl+OOcOV6mxM8ojyQP/xrVuaiJGGdbmZOxgX8b
	ZjArUm269yItggDr8+eUZ9e1V7XNEh8AyhF+f3CmzV3pP9YaAeQJ5V6niX+8ki7V3KTibZW1mAQ
	xH3soIFUhJL1dw74ykeg1RRHK9xanCyZ0+XKUuDIIgcQABvDNQFqBo9o/U/GirTWuyfsHdo6Zw6
	+TsHA/41o3PfP98iXQMKinRUVjrVNImUox93sYHFGFn29wvbJuqWELvLgvHgT8p7pNTG075GAXM
	rJIvJaYUF4suLfqv+i4Koqtn3aFcfyLuFbLNb893/ubKBAnAPs9ELiWRlPm/XvqBoZNF+0qYsAv
	G8kmOJD6Vf2f5etVS37Hb6MYpKA0uAX40oHHsGoAJIVUe3zOnF3zWrb3
X-Received: by 2002:a05:690e:140f:b0:67c:1e0d:f7b3 with SMTP id 956f58d0204a3-67c3d7afb18mr892949d50.11.1794141334626;
        Sun, 08 Nov 2026 04:35:34 -0800 (PST)
Received: from [192.168.100.12] ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b959615sm1680270d50.14.2026.11.08.04.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:35:33 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Paul Blakey <paulb@nvidia.com>,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v1 1/2] net: openvswitch: do not record user features
 when the change fails
Date: Sun, 08 Nov 2026 07:35:26 -0500
Message-ID: <179414132635.2826493.1662034784357588334@gmail.com>
In-Reply-To: <20261107113403.797779-2-houminxi@gmail.com>
References: <20261107113403.797779-1-houminxi@gmail.com>
 <20261107113403.797779-2-houminxi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Both points are right, and v2 changes the description.

The Medium one is a wording defect. "A failed request" reads as covering
every request that fails, and the paths you list do still leave the key
away from the features: the NEW unwind after new_vport() fails, and
ovs_dp_reset_user_features() on the -EEXIST branch. They predate this
change and stay out of it, as the changelog says, but the closing
sentence promised more than ovs_dp_change() can deliver. v2 says "A
failed OVS_DP_CMD_SET then leaves both the features and the key alone",
and adds that a failed OVS_DP_CMD_NEW and the reset that follows it still
leave the key one enable ahead.

For the Low one, v2 names the reachability and the effect. The request
needs only CAP_NET_ADMIN, which a user namespace that owns a network
namespace carries. datapath_policy has no entry for
OVS_DP_ATTR_PER_CPU_PIDS and the operation skips strict validation, so an
empty attribute reaches the check that fails. A disable on a count of
zero reaches the WARN_ON_ONCE in static_key_dec_not_one(), which panics a
host that runs with panic_on_warn.

pw-bot: cr
