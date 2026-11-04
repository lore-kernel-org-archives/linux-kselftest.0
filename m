Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831542;
	b=qQsgglrupvFvZmOqXp3JfojycMJo5TPCGh95g8D/CgagPtd77gxUI9UdqJ27bb+mIu9k
	 47WXlqgAEovlnNN2Tcwe29dB+t5EMkhdDaWD3lN5ShNAsJMPiScGI7NvmslT+mUvitEr9
	 JkemxzICmdfr/ws6gfVF0vTmFPnzSrmv+AfTdpMUufdKNaD565cbM/lB2iys5B4YsMD2S
	 mkErYhyfKpizn/ZCd9r/l17Trn36kTHSy/bSeDzjt3hr2ztl/razkyNTDEOaGryNsyoRc
	 lIknKWXAnIOXbrOgwa5HIQmxLBG7KnNRM7zPfAGWAnlkVHukuo9Bbid5BUQQv6qugTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
	b=VJbjeTgZxWkw40HHG75Z0uK/CqZh2Ff9FRtpGlX/toYNsNQfvDEj3WzArFO2MCD5lbKv
	 l056HaxOK6SnDhEXoUkbWNdukuHXEEkUQOPfHlSEA6T+qKVAgSzD1WAgBY9NLsQbAZoHF
	 mWL9tRKVbxFJOCiniSoT12soJwXBYOpABAnUonMscf42ZQ8rF7Z2q6FNbzb9Z/QP6k3s8
	 9FbmUQ0WKYP2uvhKbvAxHoVHJy6vQ3pg7/wrAQ9cFjhGiwP4s503YsYN6GvfAaRQ1bLKb
	 Pezi1xlkg4nfdlwRLX45O/X5UuJy/H6ge6AVjSMtAZDIk/R+Xuv2+6+d7wQKEUTX9/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32494606D833
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32494606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e60f9af6e6so12126285ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831541; x=1794436341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=Z7LHOZQ0+vcoKUS7yCEOrnmDL9Gq4YrSvwIsK5QMV9vH139XeuBqLTQbiHcG5nbodq
         QSX1ZySWx29FjN/EplLMWd24FBt+mCyTuKSInC8DFEzr0ky1W9Tq4E3HhzCZkPwqe8YJ
         PE92jDwE5ZT7DweBwdwmPnLE69d+fhrINoPAd4J/HxFH2PLl3esJAJbJDAZ25lTbiSHY
         M8z4PiYBS6k/3rqlAk1XbEvkp0km0XPgMugi4y8LbTQ5DucCb+VusJmKXS76B+JZ1z9E
         TAudHtwEEiDLzHGvErFDbIxa+pNY1DN8Je7gGT4t0smJlGP8fHhtAoBBDorN5UKEhFDs
         RqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831541; x=1794436341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=QRF8Ohxro+tkjFDxZ+YcWQYzXptYv5zACsd1p6sHffn+ctx0Ij2jrNOII1bpKZVdr7
         ADr+XhkwjrGgxJZfHzECaeWfH4kds5XFN4iqlPuAbuVQ6XYQ0+9m4gOjWIZCZFMOtsiW
         /6/Yw0CYANF+zTUsn3ynlWFBO0JzGEGIfCDKLvE4bs79D8kxHRzRhGzuvfPz/p/arVT9
         RO0caq1JFTYOL088HlZ/qMikUiU8FXF4LC6mstDUxhFdvVqMa/8lcnJzhtihk4nNIG3j
         jGk+EeGeuBOHZt5EYig+aaqdmFbF4MV+IP8ljFuMxfF7Irrlfb2z2FnfNLs/PA5eJ+9B
         NkNg==
X-Forwarded-Encrypted: i=1; AKwUvBx5GLtCnxTWOUoKQojHe+ReJPBvaUF14L86u9GmEOI4jWW0zFAy5NgsScpNkOupiFrj+zdTWXgUvd+QGtpZ/Q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sC8T0xEcB+sqkGfdlbGkzKmJlq+OnNkED6dNJij/MinmT921z
	UVjgBEwokBUcYBcRCcx4X6dYEZncvobcEb+nWA5HsYSbQkAzVgURzw3mfloY9rPXeQ==
X-Gm-Gg: AYBFou0NRCP8vZCQpjfamziMJtZOkn3vMq9ZizOKhXjoiBYL0oLg30AcoOqk44m0BSo
	kv+pky5PN/8c3n4FSKrJCwD50Uhe2PM6HfqYmnUVDiQdiXlP/d7IFUdnoENzw1U2QLA4UM4WBoI
	N/54eeZvnMFuAgSy0pZ161rytvlxDgaYE/Yxy3CSIlxiSdpa+rVuazDgkuf5Wc1NhWy6tjJ9sv9
	B2M6hedwT+8QIB3ezgIVHMALF6XY0FQxG2lNKwHal9BYCEphC6yOETx1FvhKrVyf0OvWfzq1dPH
	K+QxG/Ejdgmf5/gLimFb2Y0rVrp9djECsEyQzXuQITd8idLtg+bEn1+fZ5NTPxzG3BLO6Hqg75u
	a7hP7PnK+ng9ijl1RHA7jVmKeK0sW08qX+FMuiEmj9MSDL5onaHMjOpaXPSbEsCNv2TfIXNTP2W
	2kdmQ3IuvjPhXbEtk7X4X0EAuGktaHtZfHs70FFqBOJFKrSBIV7yB2Zb9jcITprHW7WnSrEn+hq
	fv90gfIvUCW9Uo1f3uQ4USJSwdJq2X9IIMnVrGIbMS5d2ZlOENrE+eu4z1/wt+1lyAt0/nzPUTv
	48sZKie89OQBVSqN8uj7yQ5nM06r+yL2naDDTYItAjv2MXHdxZUJjZPWFM+B2xbTo3uI37L1EBr
	wCcPNUQvkRA==
X-Received: by 2002:a17:902:f603:b0:2ed:130f:869d with SMTP id d9443c01a7336-2ed130fba9bmr22390155ad.43.1793831541004;
        Wed, 04 Nov 2026 14:32:21 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090a1475sm11919255ad.41.2026.11.04.14.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:32:20 -0800 (PST)
Date: Wed, 4 Nov 2026 22:32:15 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
Message-ID: <auuyb7FYBX7xdr5z@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
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
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>

On 2026-11-04 05:45 PM, Pratyush Yadav wrote:
[...]
> > + * Preserving a file requires it to be opened for reading, since the retrieved
> > + * file can be read. It also requires permission to write to the file, since
> > + * preserving it affects all of its users, as described below. But the file
> > + * doesn't need to be opened for writing. For example, a binary that is being
> > + * executed can be preserved through a read-only file descriptor. The owner of
> 
> Why are you talking about preserving binaries being executed? Seems
> oddly specific. I didn't know that was a use case we cared about.

It's the reason the check looks at permission on the inode instead of
requiring an fd opened for writing: a running binary can't be opened for
writing (-ETXTBSY), so requiring a writable fd would make it impossible
to preserve. Preserving binaries is a use case we care about, e.g. to
carry over the binaries of services across a Live Update. I'll keep the
comment shorter and more general in v4.
