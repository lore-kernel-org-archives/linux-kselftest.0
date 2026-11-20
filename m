Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207345;
	b=FVCwZ0CnxNjzhAY8EMVrE58Dsx073C00nzIAHfHFINeWaD68qTkz1THIQ1kWZtJ9K4+p
	 b1tl8nIEnc53EH4GWFOuuEaKqUG9RciAJNSNjETvgH1a2UQHyMSqRktkazkrIibkh+mKV
	 8ay+AUCTL6foqnOAP9odtCT78hjrL8h3MKncB9mxEyVSxi6VkGTQEvaqdiJxnJgUqG1f6
	 +XTN05ZJOIAh9buxm4TUJmJDvwcGMVtbfY0ltf5q3NPqM5tl3MIQ5XAmCWG3L8v2sq4nn
	 U7yK2eLDymANF5UgGw9yynqbASDMiR/yJrToHnWObbsdWZaShmDFKSZDHuLB7iTYAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207345;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=GAbvZ3pPSOrdVekXC8XU8MwNJ3POcX0QULZFkXtCXJM=;
	b=vHrtjx+rFphY2iHQFI918wc6nit/GUMtyfg8qRSURKBj9A2xvlF+xpBuW3vUdcvMIaIz
	 lkMBQbiWvVkQrVwm8O8mijtyN/NNR7+ZolXivl7CMXxo1i5aQ49WDTTQBJUfxjFfWmqd7
	 3TAOfXh6F+72KhO3GOy38L3soSwg2UxhZnbYSaaPdoSpAAWbOnC4VljItCocySFK1aluw
	 TlhkyP1YfacdKIIm4YVtAP2y1OUKvJWkyOBLV4iPbE4RO9ZO5Tl+NuN2uPrPVbFB4vzeq
	 2aqeGP5t3wyvxL1aR2vvu1+pFpoTHESAGCohQBBM8Q/6ny9DTOUDEIQJOLXH4lvwBeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE406606A6E8
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE406606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5569551d19dso25324741cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207344; x=1795812144;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAbvZ3pPSOrdVekXC8XU8MwNJ3POcX0QULZFkXtCXJM=;
        b=i5VjjX+MBD5bnOVKJRzVf1QHcNmGj7Xy1N71qhbVJFqWWTG2EYB94BwxZTnAq7K8NK
         Q81TTs2QpyzhKgJnWlVM9cp5UN2Yy36vcrwnyWgrAg4FotaNGOe5ov5ckpk3xcKLR4VL
         zaDBKen7pHCKrDYkt3Mn8tVALbX3mBtp7QjaLEE+c4N/PdmZ6MXTtHgxUSwbhGnHNJee
         Rvu7ZSZi4MWT0ELgImewPBAdHhSB/qzg6bA78TUAGVZob0IG6txIsqSOznpzGlqv/+J7
         m7/99U006QT+ymHQlfmWEaHTZiqyhSkCbzaPGzz+MJHlWBUb6rRZkEHUCM60nwflXYfV
         tucA==
X-Forwarded-Encrypted: i=1; AL+hErGdv5Ei/V3gtMV5NgqMYYB+V0tGcOd72eJflB5SnfaIQcXoYMjCJftyjvYeD1IfRTBuYCqkbxmRa6PI+sl/A3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LaPwnlIwpWAKazy+S+klX1DM/+VhbN+g9lRJUly47FZTn8Cid
	Fm6SCKY40UVUv5Ip5vqYIfvXgw0/YE5rupfqG6sfLJxNspXOG3q5ZMoM
X-Gm-Gg: AYBFou2Ii0uUTrUCSmRkfYut92oq8AazmlLLE9c0BQ0EW0exKQTfnquoAngt0n9+FSI
	idCbfx2WVjhIbxLFr91I91zLYxiJZ4eGCWvlpEaZqGAakuYCVuLRHn3vKxoHw8Ck6cszlJX4SJ1
	+/rikqdb3h9dM5MFTS0zMr+0S8fIoO8GNVA3AO/btDFboX/dqUDq5yIdBFgofCiyiTlmIzVMstw
	lBk8UNBxQiD0QPBykeQqAqGMH9e7Hq4m3Vdm1j46yOC1G+RkIZm+NkXCPd3R47u3WYp19j8PrSd
	78uwZ6EWTbNNPC3zZbGWDu8k1otn25QMDiUwxxw3o8W019QMVa8fxs06eLps+Yjlxh3J90XRHcV
	byiD897LA3qjboKaKB+lF8R3j3Doo/DWm8Cqpa7OdSrhUm4d5vPFzz8GeloTHg5QGleb1o/en+I
	x2uGqQWdyClS7nVJPsMNr3beOnXsO+3gklS7wUwyLgvOm/o1lt5lzWiN6ogrC6tUKGrlpq1BFAS
	cJ2Hd5Sv+X+z+3rKkXQ7oNNuSPfTku0ppG0hz4H89vDBRQvWWwjlTavZbb6qOVB77zPRFAT9bQB
	Ovu0Op8T2ttP7IVCJVt2XeuYUvFJTFpGwamWUyxvgEiV3P0xB1ZQneSpWKi30n/ogb2Rftr2Pft
	V2fArNMSV1MCOllIZpU1bGfPWcB+iLe0IBtmIYHYyA/iQMYtYJFL8
X-Received: by 2002:a05:622a:259b:b0:535:6e9c:d374 with SMTP id d75a77b69052e-55d6fcabb67mr91725931cf.14.1795207343793;
        Fri, 20 Nov 2026 12:42:23 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78852bafsm32418241cf.20.2026.11.20.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:22 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>
Subject: Re: [PATCH bpf 6/6] libbpf: ringbuf: Reject overwrite callback use
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711430.18576.13986256491021949684@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJBZ6ML455FF.15NG4FYCAX9DE@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-6-e623481cb724@kernel.org> <DJBZ6ML455FF.15NG4FYCAX9DE@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Nit; unlikely(r->overwrite)?

Included in v2 and now merged as f756eedb24d4.
