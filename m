Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90573E51F6
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701088; cv=none; b=sW1HnVIMDCTOh1P1Hyxa4A0rruWlCTTHUP7Bej8ab+qyPVPftGObrNHda5+ySCTZuylLa4ZoeBnxqaNEVWa5JqfYECcodFlPNDUWjVeWIeGoG7qAWtUudPJtrGG+Yigv+ebUVQz9/u7lBaM8UhEZF9Pvtc0uHpriEmVg3+8ye48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701088; c=relaxed/simple;
	bh=Usv9zpYi4do2lifC/zfE8nnMvp61yptX2XkYnVZEyU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqjVIWqKTh2yiaSgzDkiiDom5SwaekHCUfJMU5paIcqZPlEywBD1PzKn05cY7E6sFUbqlmGrke5GaT2+BAhEUZasawjJHh1b4rjea6j/1GvwF+HJ1FACKVtyxGEf9dGMKiy0cP6Nxfi3K8dCoxsb3QtNpxY3ojTd1ZyUPFAPM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GVaBy0+a; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GVaBy0+a"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso5176429f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779701084; x=1780305884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXIop8scfYA59+iIi8F9PKH/sL+IWlJPcxqiOfC7myM=;
        b=GVaBy0+al/3PPx4qotsRTWKFITYfcIsLX9GnH91MlkDd+F5uUyBXskAyv9Z+pCrPbp
         WsDIheZgEkK4oIMUK+xU7hqwaFWEHTVZJxlo8H8wmZUBeKl/o6HlBWVJNBgSM3W++joU
         NG+qE3LCcnk5lpC7jDWvC0IQDSwFd/DadFbl16wYuLEOodshw/HKzOkOvW5lEeocAFUg
         y7Sb3MT64pW6sAdB3RrntmfgvGfIk1XdXsKfLTaENamM9bhWXZqdnTi/+4JisqaoWayR
         UpKJz3Ldt2uzmzN/WA0ALeDIbB4w76qzkmYffZnHX6wiWMbVjCZT66HWlhjBoZ166Nju
         qlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701084; x=1780305884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXIop8scfYA59+iIi8F9PKH/sL+IWlJPcxqiOfC7myM=;
        b=iTfPUIWJul5P8rKfDmiFbSMgcoJ9BO41NFS4NKzJklGPDuSxvBK43KyildvJ4+oLdj
         csjTmQlf00W2lmSz7dw8nnbf/iuHi6RWzMoeZoC9509HWh6Z3zntlWt5M3wvh5brcsd3
         5r0MmLqOq75lVxb5IvCstRFDHsGoCp+8ALeDuvLGV1dmRoS1Dn7KVQdqm+9jyvjEVJ3A
         HUeIESZTnFSOcuqGKckyk0wqb654FprdQUh5/WGEZ+X8GBVf89xyacy2+3G4afSGHywh
         ohknn1K0MWYWCa5STXj/6GP1lUQz/560pdKLQ430+rjAo08HAU6w6NE2wpx6rwRO2UB5
         xslQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l2/skpBtSTal5I0naXXcUIxbA4R0x89OneSJ01clj1GDebwDeaxmSwZUIkMj/QKTVrR13R5nLEI/s1hJr4Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwAnAwLeOgyjshsgOmWsozCrPLAtmo62nEjd6qYKVqmvRbDy+f
	CF1ETTKfDTdnOenRONb/iB2SspLKViU4E4lla2iXR38ltGtpAq1mOaQ0Y/iss4EulXA=
X-Gm-Gg: Acq92OFYJbko3N7Hw9/eXTn/h/MEEKpzC9e3+LIg+CkIN9RbtdWO6eQZG2Fqh9BipfU
	Ja/m/8uvN590l7q8XQHSOIyhhvk7HzKa0VJcYEd0su0bZ5sXgpBo05oNqCuMbp3AJz7Tp7G6N/9
	RIOrONxmj1xjdfLl/6TIunwzU+S1/NMqSUN06syznvreQSAd173qT4U1I7GxHB6548202icLpVl
	qqwnemAfsla8HTiaGTrRq+v5gFyOTECTvsHnZz+4nLG4G+v4+vexMfeV/Ok+/mvZZIRg/vCAmOz
	GzEiPEBqAO1gSkhAZGr5q+lqEm96fjZpEE8DbiNRwWbOEr3Xo9rksClN4MjwhhZQPpoUaF1k7Jl
	eaSndulcHNarZUr7UgoNKxlwfhTbLN4Drg8NR/RhRGecW+HD1VSMgtquvTPz/WUNbTqmG08UgXZ
	cAzpGVX46hJW/JdS2NUfdVY46qxuemMEwnVQVFb7pzHgd9wZV+hmRAHuMp7YEj3yo8fmhDZTB/s
	pmXFObHjCzNGOmKnr/2U/dH6bT++Jf6MMTbuAB2tLEOx63aunSD8pUmDvgc3kJcysqoYQ==
X-Received: by 2002:a05:6000:4b04:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-45eb38b0045mr22939460f8f.10.1779701084065;
        Mon, 25 May 2026 02:24:44 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm26426853f8f.6.2026.05.25.02.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:24:43 -0700 (PDT)
Message-ID: <ba0135a1-f03b-433f-96d0-39665bca1557@suse.com>
Date: Mon, 25 May 2026 11:24:42 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/24] dyndbg,module: make proper substructs in
 _ddebug_info
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
 <20260523-dd-maint-2-v2-19-b937312aa083@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260523-dd-maint-2-v2-19-b937312aa083@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/26 9:14 AM, Jim Cromie wrote:
> recompose struct _ddebug_info, inserting proper sub-structs.
> 
> The struct _ddebug_info has 2 pairs of _vec, num_##_vec fields, for
> descs and classes respectively.  for_subvec() makes walking these
> vectors less cumbersome, now lets move those field pairs into their
> own "vec" structs: _ddebug_descs & _ddebug_class_maps, and re-compose
> struct _ddebug_info to contain them cleanly.  This also lets us get
> rid of for_subvec()'s num_##_vec paste-up.
> 
> Also recompose struct ddebug_table to contain a _ddebug_info.  This
> reinforces its use as a cursor into relevant data for a builtin
> module, and access to the full _ddebug state for modules.
> 
> NOTES:
> 
> Fixup names: Normalize all struct names to "struct _ddebug_*"
> eliminating the minor/stupid variations created in classmaps-v1.
> 
> Invariant: These vectors ref a contiguous subrange of __section memory
> in builtin/DATA or in loadable modules via mod->dyndbg_info; with
> guaranteed life-time for us.
> 
> struct module contains a _ddebug_info field and module/main.c sets it
> up, so that gets adjusted rather obviously.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 46dd8d25a605..c2b6e70f2e77 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2774,12 +2774,12 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>  		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
>  
>  #ifdef CONFIG_DYNAMIC_DEBUG_CORE
> -	mod->dyndbg_info.descs = section_objs(info, "__dyndbg",
> -					      sizeof(*mod->dyndbg_info.descs),
> -					      &mod->dyndbg_info.num_descs);
> -	mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
> -						sizeof(*mod->dyndbg_info.classes),
> -						&mod->dyndbg_info.num_classes);
> +	mod->dyndbg_info.descs.start = section_objs(info, "__dyndbg_descriptors",
> +						    sizeof(*mod->dyndbg_info.descs.start),
> +						    &mod->dyndbg_info.descs.len);
> +	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
> +						   sizeof(*mod->dyndbg_info.maps.start),
> +						   &mod->dyndbg_info.maps.len);
>  #endif
>  
>  	return 0;

The update changes the names of dyndbg sections that the module loader
looks up. However, the actual rename is not done until patch 24. It
would be good to clean this up to avoid potential bisection issues.

-- 
Thanks,
Petr
