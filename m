Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105628;
	b=oVwtjv1Ee+wg0DMOpBJxqt//jSkwsSlRCzLN2wNzOQWmZf+Uv3pPBZQKFz3tRl2DwQKz
	 b/6cINaw/1FA4g+JTxK9ASXNnqUOyGwUsjN9zTx/ZQ7iBBFRdvvMKAXSnaxwyDIXxK7uS
	 ZSzkofWaehHFmlY1D0gzO26JrkJaXzwLnMKseKmHLDfGMR52/+c3HBR7TwsuKd+84BrL4
	 8cFSWDjmPNk5MJATeNfp44Pmlgo9K5NXuzw+k9AmMTdiGj1503pAz0UyWvpPGod1HgiR1
	 GJ0RQM2noAOzOIRq6PgbN4Qyks3rZ+BCAfgx98LtOmQ7hT9PZAhApl0BguotA+uUS8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
	b=Zd+IyGqErPY1XH5+pSR4eIZTnAT0emIqQh6CoGN/vbwIvfSt1Eh38p+iQr6Xm4SdtCb0
	 sH8vYm5l4+vk7+Cal0URQUUe+C//uqYlLeoDbDt+c/1Br2fjFpQrHGQuO3lXmyOS+Es/p
	 KPjgMtkXdDCADxQlGI/pBstLRIoBFChs52g7CpTHy2OOormCah4LYGHGPtKqWG0eryLAR
	 Cgm9cmeIlBg60DNVFqujCcMSQCPlxzsNXYRcXqX3Ctla4n6DckRteykTHLtnUxehIgu8+
	 UsOOQkfO3g7QS8o0V9jbFbgKQAKlhQMH88qvkATCVkICP9vdxclq6jjyT/nkB0mBrlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UXwIo/X0";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB6606A31D
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 02:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BB6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXwIo/X0
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so130677c88.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 18:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794105627; x=1794710427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=UXwIo/X0nMEY8pSegQDtBBDEYOgg9buMlNfVpUCJaCPxyDBW4GKuSMiS2XCK+ywzep
         YLB+FEBPjeG0bpzVlVZjMHkwFPnHmvbNMfI/9AKQC7cDXrmyc22Dm2q1c0QBbHcovDJM
         c6TJ73vjHeeun2Op2KyYulh+TNEFpB58UO+7biqirYqdHGmbO+KDXbpOr9SiWBjvW2lZ
         +hfZ7CgxvpS1YkJIRXIz13FGfANie7uYVWLJWTpLaIV75vKq8eNHpF07P+Hr/z1w/H+W
         preiWv4kx455lOfOGj0+SIf+7MGQBF3kBa6Lb1UgmN7odrLkuXd+JN8FOYBXmF8RPEjI
         tYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794105627; x=1794710427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKWYlAcY6So6bitWGtla4+mL7IVkoD8l6fm1ubuoUDc=;
        b=ry4HhFiSFYQGgPmN/oGsrF+h/GJUhfor3xhKixkOobWQEDD+UJO5zfC6KcsaokUBGp
         Lo3CfW4/vr/ctquRNbPBUwj5dKJCKQ7KeebxULW0tSAaEN/6H+gFG7j5Idb2pUOMuyIE
         jcwQQMbHpqBZb9gsrFHbFxSE31i+Eqg4GPeH9bgUIXHeq5Ds3SCwus+q1dsfdk4jGQOu
         8wUicO/12W+7Pg4nfNxKnc16smpWS+MfvePGOgbCbmzelktGL4z8jN9AH+d1IW8U2dH+
         pIGAYn2kcPT4MnoMrGrDTe82XXujX9h91D2gZeLfmmEieKYTZmpqEmMNpCDRwur1UiDI
         tXVg==
X-Forwarded-Encrypted: i=1; AKwUvBxK75GQUahRNvPkmkqF0LHm7hupkZHBhnhFuF1Drq4h9piRutIvLU+d0Z0sl8BvHKlc9lhW435xgrWQ2IUDZ6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gvzJPVR1wNNoBYZa8GPZPUpOudjPDi7FM1ZWmhdzcSLxxY7Q7
	LKkI09JgZeWaWei6Ds8ELKK6hM4hZ/P5X7mjliViNjpTok8u0xxCj/+H
X-Gm-Gg: AYBFou3FnCPsySD8O9z8UiJjvn7S7fuEKOCWeIn47X5kqYz/ltRsI7wJud4OWl7Q2N6
	462EYFt2Ms0pKfwB0bwXsiu04YQ2ENKQbrTuqmGkLATXhT9A7JyUtZTILA67V6dEaBamwqnmAIv
	e9LVXKHkWbR8tWTeeZlL+AXXKPnl1ffQLW/h6HKIF8MBfX6ICWB0kHB4/zmNQtysPK3YfufXk4K
	IbAfTozOYGJJkJbZbkVN0AeRxlsYO7Yhjqn8K7bdmG40hqG7shLK/pTqxigAruHzhHhCIB6Ueex
	uC9mQi7+wON+CpxfgVf5AuWY9tuOeVUE4R7uJHfJJlNqgV7mzUlucy9F7RMH4BYzjDDz8Mu+Ime
	et06kXiYO446gHZRHnqZcSU2vrWtR+e1Ovq4ydkNdgPeW1AolYX46irkVneSEzsVthnIt2UBKyG
	Hr9GZkMdtzrmmNS78KE2V0R1uW6Si2Y6bSWgmJyZDhTteS82O+t5UHCDvEZwUfJdyl8oc7k80h0
	acNQvce2h6qjo8FgtrpR9zdE4BtxroE3aNdUPxuBFH7WcMmL4wwVu0O+U4ymizbVsZWNo4GhyE6
	+BYV7kOuERCDdyED4Wf3
X-Received: by 2002:a05:7022:29b:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b39fec1c25mr452900c88.8.1794105627500;
        Sat, 07 Nov 2026 18:40:27 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm2228842c88.16.2026.11.07.18.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:40:26 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/ksm: align smart scan skips with the scan number
Date: Sat,  7 Nov 2026 21:40:19 -0500
Message-ID: <20261108024019.1195186-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com> <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com> <7df793d7-55dd-40db-8455-1f22bb44193c@kernel.org>
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

On 11/7/26 20:51, David Hildenbrand (Arm) wrote:
> On 11/7/26 17:57, Qiliang Yuan wrote:
>>                               before     after      after/before
>>   pairs merged (of 420)       361        420        116%
>>                               334        420        126%
>>   pages looked at per scan    1792       2048       114%
>>
> 
> Oh, I was wondering whether this should actually go to stable? Do you think the
> above is rather an extreme case, and most users won't really run into it that
> severely?

I don't think it is an extreme case, and the test above rather
understates it: it makes the second page of a pair mergeable while the
first one is still young. The age of an rmap_item only grows, and is not
reset when the page content changes, so on a long running system most
unmerged pages are past age 8 and each is looked at every ninth scan, on
a phase of its own.

To check that case, I let 1800 pairs of unique pages age for 32 scans,
with the second page of each pair made mergeable 1 to 9 scans after the
first, and then gave both pages of each pair the same new content:

  kernel           pairs merged after 16 / 32 / 256 scans
  before the fix    112 /  200 /  200
  with the fix     1666 / 1800 / 1800

Before the fix only the pairs whose phases match, one in nine, get
merged, and the others stay unmerged. Three more runs of 64 scans and
one with 128 scans of aging gave 200 and 1800 each time.

It is limited to content that is not in the stable tree yet, since KSM
pages are never skipped and later copies merge with them, and the cost
is memory that stays unmerged. With smart scan on by default since v6.7
and the fix being small, I'd lean towards stable.

I'll send a v4 in the next day or two, which also makes the new selftest
helpers treat a short read or write of smart_scan as an error, and can
add Cc: stable to patch 1 there if you agree.

-- 
Thanks,
Qiliang
