Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE944CACB
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328492; cv=none; b=rC84yULbcY7QJ+giy4a6tEA/l2U865YYSwZxaLxh2PwyybKmU5bEVG3ub979HYsxDMEOPa8Nc2I1KXdDis0gn2HTFjas9U3h9uDlhyt5Ede75J9Q2D2YcSRXUzRPgI7AfQwe1wqzYhXFa1wel4QMwkVi6c0if1lY5UKGyYGxoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328492; c=relaxed/simple;
	bh=RyhPOU+vvqd3rl1UlRjckMuKAfbjLaCIW52sS+yfk0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag7AHQe9+M25v6N0Y1ieoP5mLNz+iDaJuaN3bfdZynyXFKzDfSB/ZDO+pOcZ+ALI8YFSsJlppN11QORTTbpojVnmPPky/5KkB+GZtda5ZLgWeIt2tBKBFAnAiSMt3hMWeFIv+Qwo6T6UDYSVSXDe3tWQIh6hpeHSncBkJGpUMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YCaa5B8/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YCaa5B8/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so3706855e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790328488; x=1790933288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GuAasn6M17RraKJz85D0VGepUYYLmKKd6LjzFHjVWiA=;
        b=YCaa5B8/bbraaj9MXbfcKga+R1L3Oy53Dlm+QLJ9PluOw2HJuSZ4RD0OUgpEKjEDys
         1iIjGIzlaLXJl+fJzhD4jsJKpX5ftjb/LWFjKjNSvN0uwzojBFSmYZYw1vDOyCInGbUe
         d5kHIKVqyg3wLnQ6C0VSNz7g/+iaP/c5K3E5bSPY0TEFeHNVg4IhHe4Q2p8E6MzsC8dT
         n8na7+M39OVdS6Nak1AG1EpnfI6rPQBVhwmwML6M8v349eGyR3HHS2N8OshqSNp6V+WE
         IUEAemD4YTNyORvF5Su0LA+6HBShR5Rw8n06UjjwBYuJSJyZ6FP2VmqYggRcG9WSYKNN
         nCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328488; x=1790933288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuAasn6M17RraKJz85D0VGepUYYLmKKd6LjzFHjVWiA=;
        b=PIJ7kQwKlM50Oka+B6XFmz4F2QG03gTuUS10x6dOTLFkJPppN+1QFdgy4PHRNa6ANX
         DrAcMHEKe95p/oRijrKgYFpRcTYBVrovY53JaLZJLPIyR1Oc/7jXeXPjJDSvdLvMk/M4
         YWwHl7ORMtbeU12Of+i0eRP5h9jUe/3rkgaN2BeotOBqecTXEm2hbqrAsacwjjnlUMbe
         NTH3msoYrBnr87Tlyt5WST4OMEMBLDZ/zcy5qSSZMprOIcIf1N+LBzFdO47lbHlRb7qv
         7iN44SQNqcIdyMT5/6+fDyVz66ejuty+FH9PbYVlrXkUtzx7s7gliksThTBaWHBDWxyY
         JPbA==
X-Forwarded-Encrypted: i=1; AKwUvBzZqaLNh/Zb5vfgCwF5/+poAtmvdH1ZuclOYQppbM5iULsZfdg941UW86IBXdnqcYpgZHFxwS3xZMP7GfMeGZc=@vger.kernel.org
X-Gm-Message-State: AFuF++nAs7r/hfXdYvOkuRprl7gXSJ27QfIVz44h+ljkLT+CfXD3hhp4
	bCNyNw2rc6Ns1B7cCQCNscjizqfvX63LOBknlXCrkxG4nfAa9Poul3uax3jsDpFdUec=
X-Gm-Gg: AYBFou0NOPVRBJnt8fsMziki2r6wEOT5O4TLzkceIJ496NHtKPBL7zf0bc3Txd8MG8R
	OsTUJpXJwTfc4nk4+cKp1MflKTohhW3Epmj4XwNYoDX3TQR9sDiCNwRK4GZjwcp9olLRsXrXW88
	9316D7CEzzqWOnfaaJTjXKHZyw0AdBnp5HDin+Ebq2fmQkO/FuaJM3tGGa2v3EGNmJgA46mss/h
	a6mijH4L/XDLm+VUVHjHK0q44MHMxfcueji1zxu+3gCu4luAEi3WPo7ou3KhYQiY+pUiWYpuWaQ
	nW2d7rYrI1NW+gExcHyA6n6A7D8uFB0YDtsQvlET+5plWrjVW0LxOek1OTneuL2cMXDtg8IKCtj
	fqDyhXThKEcU/kUbM2+th5qa2a10wB3hyytn6k3e8SATNhjN6K7vjeDne3lJPeNSlNQcn4iSuCW
	GtOVXizTq9rIjIlUnYDm+Z3eaA6cvlR6g1d7egCc6P1eNKUSM705Hk/7d27NbVX6uBk1u/IkNyQ
	MXGfYE/mbsDq3ais3xnErG43bqlObRqUy8NaWGRSbNlhw==
X-Received: by 2002:a05:600c:19cd:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49ff06f7a45mr28683465e9.30.1790328488006;
        Fri, 25 Sep 2026 02:28:08 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm37140085e9.0.2026.09.25.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:28:07 -0700 (PDT)
Message-ID: <f1d25d13-4adb-428a-805d-d3e19cf1013b@suse.com>
Date: Fri, 25 Sep 2026 11:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 20/38] dyndbg,module: make proper substructs in
 _ddebug_info
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-20-9b6c217fdf2f@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-20-9b6c217fdf2f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 12:34 AM, Jim Cromie wrote:
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
> reinforces _ddebug_info's use as a cursor into relevant data for a
> builtin module, and access to the full _ddebug state for modules.
> 
> NOTES:
> 
> rename section:__dyndbg_classes to _class_maps, to better align with
> struct _ddebug_class_maps.
> 
> names together, for more obvious name pairing.
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
> v8: set maps.len = nc unconditionally
> v3: squash in section name changes.
> 
> v2:
> 
> Move RvB after SoB
> In structs _ddebug_descs & _ddebug_class_maps, change int length to unsigned int
> No use of <0 vals is contemplated.
> 
> dyndbg: improve section names
> 
> change __dyndbg to __dyndbg_descs
> change __dyndbg_classes to __dyndbg_class_maps
> 
> this sets up for adding __dyndbg_class_users
> 
> fixup-drmprint
> ---
>  include/asm-generic/dyndbg.lds.h |  14 +++---
>  include/linux/dynamic_debug.h    |  34 ++++++++-----
>  kernel/module/main.c             |  12 ++---
>  lib/dynamic_debug.c              | 101 +++++++++++++++++++--------------------
>  4 files changed, 86 insertions(+), 75 deletions(-)

Acked-by: Petr Pavlu <petr.pavlu@suse.com> # modules

-- Petr
