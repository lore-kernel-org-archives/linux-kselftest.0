Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690308;
	b=TkZ9j62FBoYc/0RjbmVtlIluzL1NkEwDHOegENkn875Ti7SOC7gpCpIQsHAkA5vSyaNe
	 KpJ8MKBPRA8ELNyRbvcgDJSMIa+MBenwq+KcLYsIYbF8XcACQ82OIP2kkDX4zQWu0EkPO
	 QRUFjP6Ml153FhYs3hw4FMU7E//Cs5kb3EtCoFbC7eKKxkllBfb0q5Mw48quOQimpOqKI
	 F5WVia527LP8dZxHUx5jr3t9XQx+bMqoOdesE5nMQHXaBqbIy4zBEQBrodjibnk8wkYU7
	 Uloy9M/LojTCF5NGsCU8zsIYQYhkujoGTTBH+3FByLG2cp1ttL0NYHSZEJdwkp9eZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
	b=1C81alVlH5UJeUj59wjV4rd5HUgcfE2vt9azcwJUTWk5cqKb0zwWI35fCpfDYZ70cm2g
	 nzsrNvgkR4pqKZjJlKUAdinqqevwDcsp7kO7gPpjRrCML1YZQoTSISG59ILcbvDN0f3YQ
	 zvQvpvSuhk767gXpEfxPGsoln2MyBvEuDrFai7xnYeRSU5/4gpklwv9hx2+omZlIA4Yy6
	 z5EpzoLYYwTgxYKJvp1vhrQmo2bldw1OrV0ew6D7jPgxlm1VUap8ApT9BKmg4L+KNuQTE
	 2DtBqxA4L7NpGNoffWclusKCeGM3qn7yq64tV/YspmimyUtRCgBWmJksy3hWeDvN05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999B606A32E
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8999B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2858252a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690307; x=1795295107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=Fb5v+9t5HQpH99lBDL6eSyXCd561d6T4RIG3tul3obk+hV+lLvqwx2E/a53VBrruzj
         C7QdCNRUNH/J3utrvpe2c/geGqZ5Sl8S8ROXMNSnD6HIxac1Ng+Ry9w9h6KKx9WqPGRk
         nL5/soLI9m/NrOZQjEKC8IeWYL9z0hSTP62ueEx8glDPxYjodiB5UKN/us3YZ/pjLuiy
         jR7DawCFm/DODgpczCGYTo42aYB6PExJBlNnAUTnFQ1VK90sXBu/fB3nC7A4lv4SEGbL
         FCfXgTsCZXAhHYy7HOtrxslAD9W2+jbfWDGJdsvIuv9xo7so5tZou4C9uFbhXQelwj4a
         ryLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690307; x=1795295107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=iw7dfJHOAvZ1yFKTEZFiyfy45DLf6UsL7WF6DeD/cSPiCtNStHJ5wqvddw1qzhYxDW
         zM3OfvDDBxClZM4XNMlRvFbdno+2NN/cX/YxrFZ3H/l+92o0DnOjHTh7DiEueONsuup0
         g+p5IBbpOTHk2zfny2hQ4mwKkqfe8MSzsX0uVmdvBfsteSoWmikIIA+l7Zsgiip2tFos
         bfCKB+RDlMSfQfEk5tD9BcfI/EbbBQsEG6J/H3J/95QXtScwC82u9oddaV2LXvuX91sX
         Ofc+jIP78OjZcM9EQcl6fGEVjx7ENMn0PsIm/zXHhBydGG658OSOO3bQ6rQh/TPfxQPO
         fCoA==
X-Forwarded-Encrypted: i=1; AL+hErGzp3ULchSpd4E7W8WW2/GsMq01F4WuRUGYJNorgr1cHnw7woBtyzt7OcBzW9yOeGYnnLLdcfvbrAF90wk/BHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4hfaiiirENZuQcSgznQBZURtYER789chWruBNvADJDLuLriHm
	CGhBabnB8UseA7+CTrftLy5IZ9oeGlQbXYPZUVQXh8B3T2u1CHraiv7q03LGOodXwg==
X-Gm-Gg: AYBFou11kJFTwUgVqBduqAZcDVlEM6P06324ZPlOYDK8i3glFI1hWwMPdMb0Lp4Is03
	WYE2h2UIMRL84lAjNPIWzufX7MTY4s6oPmAzLEzB9mbG8le0pEC0INwNjpkl0VYRzQWq5WQq+9z
	69kRTxz3I3QJ2olJqh8aSjVBSvaG6v2CT/F7h3kD0ASiqVZuFq8yvbeoq/NgPUsnSN07vDBo1PJ
	xGVtFTbbTyY5/1I2t6cDDraXEpO2qNMTLKf1pPLnBoAbibm6s6BsPMBgTb7KaErJLPE30snTiKc
	2uhojwbmC85+zuckgBFw9+reCw76xdK/Znk5+GGsj3hxI/kbzxw3f6BOcMFEinjIk/wy+oK7WB6
	tyIXhdTuNryKU9h5kB1kHfVzFWnjvaTtOKqGwPqsshRjCydg68BsznyqVc3R13crL2G4VORpfUV
	4yPbZxGinLkppj7b0CuLjPzZ6Z1GR/ZWIGQnUJDtaUw3aDyJHzhAqBi7FHLXZw+I0QkwiK3jEdU
	kxXVwDUdfZEiOaXsmIEbZE3rGHSfhjQwy0jtxzVcw+epzCfHnQtA3jBNML0TNgxeqzUuvOArAI/
	sohMsD7rQj/rKyLCXAQFTZJF9GKajdUuoz28EatC6cwt1LxSeqFkjGQsmWib30NA+4l5xvcAOnC
	d+GY23oc4V2lHbIClCpLz/lbozGtAzJaS5rSmZqG5Qo0E0CnVDFGuXyob2mL8kKsxcn9ogjFxAE
	sHOPTmskciV/4Oh1ePMVnZJW84nclV4Lfku10bM/Uk9YYUVeeXZFBUNhQD8Qz4UywrZO9hHbJqY
	DxcCgUirgI9GmAgcf0un4KX3WZEJEgBdFCqzQ+RNXk04GCZwclSAR8RTr1E959UTEsI5eQKDYM5
	3nfLtdE1i7VAir8+dr5GHH3l
X-Received: by 2002:a05:6402:42c7:b0:6b7:eda4:e136 with SMTP id 4fb4d7f45d1cf-6b7eda4e281mr1321653a12.41.1794690306618;
        Sat, 14 Nov 2026 13:05:06 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361280sm2705836a12.10.2026.11.14.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 22:05:02 +0100
Message-ID: <20261114210502.787195-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179468119953.2168702.10813567320493574993@kernel.org>
References: <cover.1794139176.git.julius@bairaktaris.de> <179468119953.2168702.10813567320493574993@kernel.org>
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

On Sat, 14 Nov 2026 18:33:19 +0000, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Reported by the hosted Sashiko AI review of v2 2/3 of my "ipmr: forward
GSO multicast packets" series:
https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/
I then reproduced it with the selftest in patch 2: on net, 6 of its 18
cases fail in 2 of 2 runs.

Julius
