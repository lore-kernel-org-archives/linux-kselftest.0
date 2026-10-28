Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174578;
	b=E/ODB7y7pJuQmXJOMKD+u53kthvYXH2TR23RcEx2unz3XlF6Rpvzh0m3RaN3xKFANJb/
	 MV2JOa6DAgPbYvjwR6qtInUl4CQ4f6KnMn3D11hd7P9vT/K8S2/00BdLkGPBb+LtC+7SD
	 WjA+B3qMd/NFv22/9tiFmPGqGkCU1kkcSFQGZvht83hSnz/8wNeomseLDvOctrgPyPybF
	 IMCOtHgDrH6HQXYQzUmNCx9790kVcpyjjtGUXZBzBOC5l0+khjlsSIjD0Eon2BVKvk/PO
	 dQ07Vai5udGyKwrBDKSu/BDO/nTc6Dznfo9m7n6osV38DXUV8DzG4q4Isk6kVu+zegw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
	b=YI6cRVKshzN6hp6yXHr/Z7dxVG1LwbD/ukIgnL9L9KSJAge5IrGh6HxPnr1Uv9S4tpL0
	 nuTu9P0eo8WoQy1eQI5EvJJGofWgDQIureNaFB1RpTz6QMjzTz1EHKi9FLv+EXEAEKf9/
	 O0NYJISUpIEBpkmwuidWwT9uKQg5evvBWZcvznnAhHwGUpqm3x/DZKi7lq6Ar2bebW2KM
	 qlXRt5kdtblODjn2h2HgdCd81yV9/yl/KXFDay6WraFQIiFOrYaGxpiAyFEcqbREVNtJQ
	 o9OQmdS8FcOINpnSf8Xks81SitzbGDTp57GHFYLI5F0YtuYbZpsV6iIaPq8mcYFPqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkIpKz9F;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA19606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA19606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkIpKz9F
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4326803b54so37133266b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793174576; x=1793779376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
        b=HkIpKz9FFc2HqnYDCDCYayicH0JEBPhH9MRCAWZZLmXfr2J4FX/dgFIxfgh/k01LV1
         rEFSChRE9gSl3NihbzHC4nid1ZEXg9Q0bH8TuX48yTby3aTOwQtjaZE3ac0nDx/ETo8o
         0QfalhoP2ScsJKxKBOucKvhowRpfNtAxS3dbgBAm4McR3XKRtpP/KH8MQWs2biLjZipH
         cDpn019yZePDBwVjvgZREq3MEcR96Y0iseeTLv6PWO37v0HJJg5E8LAX6bSaWiFBzV5y
         GDQt8HfQMFwhBm8EEN3Is76vA1jpuNSl9Zv28WBtEqKAbuxEuJ57eXCVgRi0x1wFJwwk
         GfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174576; x=1793779376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
        b=KwAiDRO5yB9nSkWZxhuHojo+ivhIM7/8PBrBbqjBIeTSdCempu0YxB5ah3gmLqAqAk
         SuTeKIqM/m4Q4jreq7SkXQysmxcO1VGczF7unpWsrqCRhulalQWr1JoaLDrucnTteRuV
         0WpmuvGO5K7T5jMsJu2RN9xXNG87seo6kxBYtW4TCTlvEcfXdpCBZo3rFj7vnGrc0XL6
         ByCHS5OOwoDOi3MofDfzeCOmA11I5CnA7oLaIZjWcza5r9b+5OR5YtPJit5xdpbmr+a3
         fwOQ01Qh1Opi/x+mP8YoCYietY3+Il69EMXNa6V6l/7CHXXVu8NUAOx1Lr18rXboSiaM
         4AEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz12PXGGTg4AwxU45ZvpEmuRFspCWzV8FD+mGfctxLfZX6dA9oRV8UGVhVtOfNlvzcoTOZWBoPHS+8DM2wsPQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlP2kvMOGjBzYTWw+1M4qySOptVRPu+CFtwgydh/VzMmhqxBYv
	6+MggTp408kzUbOJlodckdPPcagbE8NLFcQL07JOljKNBQDaGFlH9tpK
X-Gm-Gg: AYBFou2mUsDY+ERGZL4hM6Z/lHPbxjUXI8hJe31VMzhVMm6MX0MFeucq2zWuqYkmhoB
	DPq8PJdwq5puxi0H4O/srDzV+34e6W95IHqZTDyN5iH9S9VSOTF1X5bqNHInCb1Gyw2Wjh3wT1B
	Tn5Z4SzRMjKw5Z27Izhy67Xpvh/UnhyXI+FDWOcaN6Wx+1g7CvNqvn5kISw/7yqjLkVqdJmNECt
	8T4ziU9UkJIyTGZRWyza0nUTworE6BPnnqWuxqfLotop7uO2X+Z7R6YSz2C6GUVKONoYzKiYpgs
	dqXH5qnNs/2otynhY6Q+ssPsp/hRb9WIH8MH8rQoNQPOGduElmGz9VI+ZUEasVNpAR0k9emV/pe
	Lqdg9SvVkg1ikpKd6NMPasphfIqD+ILQUZltXu12xVGd0xiZ6HntIcrk2hZUYwRPVVyg4KOzjU5
	co7O3OzCxQZPZD+bs/b/LDg/z0rPOhaj+/S5E2ReVVEJfasSJhvjCI2CC/cOEVRPusBARzj5VzJ
	zKbYR5sVsSyHAEjYLzDiRZJRgwKB1rDwEB3WTC/hGVhAIqE3GeLvhld3MYouOH+JOEtsZra0eAt
	M3ba1tm7auL33BWXF+mqtEUt5PIg0Yg3OwP9+Ksr18TqYg==
X-Received: by 2002:a17:906:7312:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c49bdf7af57mr116720166b.36.1793174576323;
        Wed, 28 Oct 2026 01:02:56 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm28580793f8f.51.2026.10.28.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:02:55 -0700 (PDT)
Message-ID: <21031961-def4-4244-b5c4-0ed0830beadf@gmail.com>
Date: Wed, 28 Oct 2026 09:02:54 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
 <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/26 5:07 PM, Qiliang Yuan wrote:

[snip]

> +# Usage: load_module [module]
> +load_module() {
> +	if [ -d "/sys/module/$1" ]; then
> +		return 0
> +	fi


nice, this also stops it from unloading a hwpoison_inject it didn't load.

tested it on x86_64 in qemu with lockdep and DEBUG_VM, with
hwpoison_inject as a module. LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
