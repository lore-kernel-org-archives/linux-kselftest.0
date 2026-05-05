Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522D3E92AB
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968363; cv=none; b=lhbw4IMBxZO5fe16OqqIcg0SJbD3MXHNAUXBAZLYPQP4P9P3usgsw/Z3HDIDkVoup0/7A5HW255lffX8Trzl1g3Ji6jI2OT28+5kCuts0CnbrPGdm4CiUynr6ImCxf7h9J47ak0c4krwiNXXXwX6AbNYe9sJdfKvDGKT7kxhs44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968363; c=relaxed/simple;
	bh=TqmMZNCY2zf4QpwqPM5YA+Bf0rrc0JuU37dmVTHaVow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJFRdwj8p+UwAkRLLzxuIcsyLBZtF2ugb8n1fcC6JKpnRr2AEnpQLAFej0soqtwxVRIuQi9fc4bllojbxh8iVSaS+OSTOeBKEiu9Gb/gnWGwhC3cUW1ORRVIAG9T1I9rcObOuOCeW4V9fbFcnJhvZzDTq8z7dfzgFDe8DdjtTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ESh91f/S; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ESh91f/S"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so32792565e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777968360; x=1778573160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYTfJuO6eDvzZyUqAfwF5shhmAD0fGlXoIMF7YvMKg4=;
        b=ESh91f/SFF/5/3/7Yh6ouulvWK8LuLWqVtvZLJRUtVKYSvbDr+AiD/OFI6OhcuUTvj
         1YJFhEJtQN9EHRxXFL+xYrCmnie5w9XxkjL2c583rBu8IwoUcG/6+1/fHH7AlMP+EsyK
         0Xy4l3b/4KyaJhr8KCALjbL6eNCLUxXhZEHE5vvGocOrd2IdRyYOe5a4MMJr+ZRWKuCZ
         2X1kMiCUZmHVq9WILoMUegVtbioAGelhrg5fvBYfSKoTAhlsuvDjWHwidUpkeAanOLOh
         8YcK3vWaD1l0R+Z2Onk8cJ+qDtVqiWA55hgmfOG12GKeCc2w2sQEz6WilgFWljsL6ltK
         X07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777968360; x=1778573160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYTfJuO6eDvzZyUqAfwF5shhmAD0fGlXoIMF7YvMKg4=;
        b=RvxIpSv/v5Txez92FKhAaI34OAQ7qC+5srMe8LdcBaf17NchA00K/ucmO0nU5ChmIz
         9cXEylQPEMlAr0o6ZiUQPeAKQ03rpmo2Wm5t8KK5cRsmrS4FZ3ybg26IWjKoAxJ3/ZGY
         q2+snilPzvzziM70OCzAsObBPxCzGhEoLQCN6NRks1cw950GhXnOivq56SS+VLEwxJaj
         oP1X7n64g3zFKi+vlboCo2I8YKr1akK2B4dwW3Vb+NAWlVqm2tLeNOZ1UmLTLbXYtQUk
         IDk7LhvxFvPM5wT6kEC4JzzlN8AotqTYw1QERa9nvfgG+tiFViBpxJ7Kbna0OdmWxsHR
         3+jw==
X-Forwarded-Encrypted: i=1; AFNElJ94cW/s8cLmAWmchZdcWRi2X3kgALw+DM1aSI2WDbBZ8jQpYkmAnUdjM1FsNcN0qNfT733B0TSVmhxEEHQ/WEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQaQ0tUFussY0i0nZ+ratqYcT/MV5mmBeBlpzXR3vDJfBZzMV7
	0Rgd9iZZbHZx7msC49psjTHtExSWPCRrVbRllnfCLnfGPXkvhWLJ2f5ql8+FWZTm9gg=
X-Gm-Gg: AeBDiesetxmtOKqzWMbOadnXig5AIKPk8F69tM4fN/q3X1UuZGUsyZ3meqINnQjQ/Pt
	yO9u/YlPC8J47cwhs6soIHl0Cgb451FNWbJHlcewHYiCdJAzgjgSxJ/cMIFc958tmn3E71Irs6j
	UyzeKKuFlQo9/CSPMr3bywUr+rXQ6W5GdwmHEbube4Q6dlPkTupAL2y8vls/b/VhHPDCg5aJCi1
	5CiSx4ZzlF8jWXfr9/H5LlBQzczppTTuC1YjwG/FSgxI3ywVYodevElZHvC5qHAPGntGS9kVKqE
	M5PVFoweo/6+nA1rzQBUCOx5J05eRLw/CpyXRbIXLSFaYRHzYzMhH7MbN9Ns8D5PM7SNXFBJF/J
	2aziXzBUWjdXZ8muf9N8+kuFr54wLSr90ALetdC/IeZeG9tfKdNFlE58gGIBlYqMt8R2Lu2wmcj
	7ojvEArj4mW/QXRsLOahrihrydpe8NOAPdvcVXUOvtMNpeGyfCz19TlGb3WoZ3p+OfUQ==
X-Received: by 2002:a05:600c:528f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48d14243e52mr41638215e9.7.1777968359879;
        Tue, 05 May 2026 01:05:59 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm453727615e9.11.2026.05.05.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:05:59 -0700 (PDT)
Message-ID: <3b17d3a1-bd84-431d-86a8-bf5dfcac09fc@suse.com>
Date: Tue, 5 May 2026 10:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] dyndbg,module: make proper substructs in
 _ddebug_info
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Baron
 <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Shuah Khan <shuah@kernel.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
 <20260504-dd-cleanups-2-v1-12-6fdd24040642@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260504-dd-cleanups-2-v1-12-6fdd24040642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/26 10:45 PM, Jim Cromie wrote:
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
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Acked-by: Petr Pavlu <petr.pavlu@suse.com> # module
