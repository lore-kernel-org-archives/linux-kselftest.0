Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285817;
	b=GEIt6ue4yfS+c35pk8gHSDQFCra6gQfbkz2xXsb18fF2qlLW8KFbqJCBcHT/6aLJKVuh
	 rXTkqz+SLgjw16duCRZ7hWEHX8ugmbA08rGeqlEZ5jyTPkPbozsHO1ZD7AUv0JdRRFOOo
	 isJpZ4XyogENXVd/F5ZIEH5MPAU/5QHVffHzVCjCGaxOApfqC8Rx2cIsoNzGVDKZlZSZ1
	 10c++xNIyv6J/gJLeXuj6f7JY6AnBopq2vd8YRp/dtGQNe0FGdYqc4t3Vk3NiWqJVRkBC
	 w2MVJX0F91+0RaKOOyZm19GiKJgSNDMfYYzNWCKXZRS4gkVr52sNNkRh4E+SzAfKACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
	b=zMS85GzfzMdLeAbJzFSrkno4R6D+ul1W9hcXj0Bhz86VhgJ2szpqyQ3/Iwwgw71qCEh/
	 x/6Zjrt1W/GzmokYFDYI/haSkB7hnNCpl8uZfY2uWTNydSjfFLXq0gs4ZJ7WZ9xnJrSRo
	 AWmp2gYP3uVNYV+f3OhDQmztqP5/xPImAnPQrk/jYcJnPgl2BUGYOy52bqc+yV6tOJe0i
	 BYJ4W7VzkTomd0167GE+ejPbTeAaI82+lcVg+bYF+zZDNpoSFyCGlwwJIuJEsv2uMvJHy
	 pZlahgpkYLU0ESmxQnizMStiMMO3QO1A7tpu44Wo/e95w39ibxQwb7a9yOEYOHpAd8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VBBtzV54;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19F606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B19F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VBBtzV54
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1796036f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793285814; x=1793890614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
        b=VBBtzV543IUjp3L3nroXQrlC/QE6S+8gXo6jr4I0eHzp4Q3/fgQ96if7xtxcQ+VqLz
         s19qARniM3o+7h8g7xtxQPTJw/6p358LWMNXRgqkJIbnJXHxlMrWB7nJPDaF+NKET7mJ
         0JgVER0btUhOoW8vZ34IN5qvDsQpFvfF6CMOLDdw4Cr5yB+LzHLeARk1o3ukGjmCmDUt
         kXFNpVftEBMuvndsJvgf76u6usMMe1SZa9+N1Z3DTuOK6veiNZBgg/utXmh9//asLtiU
         DoqQFHQyI8iPg6OBshBXAjQR+NUPAsqfXG2eCbmRTIiNmqjpPisFlRbuRJxjKj3j8X9p
         322Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285814; x=1793890614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
        b=JbMK3+BMA32PMP5R9e9cnmLCDBYPpDkqIjf/8OxokNAC9FQRcQfFAoYpWPVQWbBaqV
         LYdd5+DctNbVmxlQZauAO87FZ4ERn1AKkPMbsf6ZASL+uR152xmPGicJP6BASGtY2yWd
         q7TaabMLkVl73s6gWL2XkBcrDsP/uabL3xuMdV7pf6sCDTXGf6jigH5EdxnnRNHudyaN
         +Z8PG0nItPsF2txX/DlrIenAf1bA5yS3Zipk2M7U2FU1VFvhDoyXlozjBjcG8gtwjnsy
         jtizE/7jUb2zzsvMU/EGUgVVyMjopCuFEvxuqUA2Tbljm7TTF/f/1ZePYBdhUCt32mzA
         fs4Q==
X-Forwarded-Encrypted: i=1; AKwUvByrZDdJyBkCIUXO7GfnTJliZUh2GOxjEj9TUhj3IOu3sRXtas2Mrn07xo2WSFkxnaCdfmceP1JpGy/zEtpcbCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnP19pJYLw7BAlrtN3AdifzmB0rTQBUNgVeSRUanqog9AL/ZJa
	KCwAf8+Q7LMa/+8gEMZSefa7TF01hSeFdnP+xbXUEnqTB8ivfvEjliYB/5oykihFmsw=
X-Gm-Gg: AYBFou1Kjb7Cd/zs8E+1/KvGkNAlThLZbASoJc/QQCBofK9PmIGgbtdCfJHaokCe1RZ
	Kq6NokF2IgDQVdi97ZVd+GcQQhmNJjqvvc1dFdMf1y7gRCs7+olfbiPOso2e5278YGTzzNz+iZF
	yXrXmkgMcRnKIH4djtvmHQhd+ioOEyD3URfL0jH85L/O2AbQk6K0dSz4cvYf6mYFyBJMFbvOXM5
	7f9+Aof2Fc/Npa++sM+6zaEqxioINENZBnp0S6c1zHeeoFNXP2HgvRWaBPG0yVZqhPPEDCa68rI
	MJAtwbKPioI0EWXYJZMYPvv10iuA0ss4uhAsB5OuVQ9/X2hnI8b7NJoKHtbUohWmUjq+1zR977U
	TI98TldX5cS741iQ1ZiIX18KOsylmTxWuzZg4G0wyRH51YWINuzCGONpl21502lNywnYtthAsme
	YNmYFMUvK7nNFaXbhynF2erJA2q35y0Pngnr5y6yH6eCI1iHzyQaIvuVSFeNacWzpPHrbVqyApa
	1ElnrCN6e1BhyaJuheO83xmgJIim3JcWjRXV5YOI09dOIydmxSuG/u6sfhoTQsGMoS5StOTyA+O
	KzzteEz0+FhQH+R93f1iNi5QCclCw/95xvE=
X-Received: by 2002:a05:6000:290d:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-48e6a234a62mr3002384f8f.54.1793285814407;
        Thu, 29 Oct 2026 07:56:54 -0700 (PDT)
Received: from pathway (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm35816798f8f.10.2026.10.29.07.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:56:53 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:56:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: jim.cromie@gmail.com, Jason Baron <jbaron@akamai.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@net.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org,
	Philipp Hahn <phahn-oss@avm.de>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from pr_fmt
Message-ID: <auNes2b11NqUey3C@pathway>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
 <as4W9hToBqAvbzJ-@pathway.suse.cz>
 <20261027132253.5f3a461d@pumpkin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027132253.5f3a461d@pumpkin>

On Tue 2026-10-27 13:22:53, David Laight wrote:
> On Tue, 13 Oct 2026 13:33:10 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > > From: Philipp Hahn <phahn-oss@avm.de>
> > > 
> > > pr_fmt can be used to add a common prefix to any output from a module:
> > > 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> > > 
> > > But adding additional arguments breaks dynamic debug:  
> > > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, but takes just 3
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |                                                  ^
> > > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > > |
> > > > error: ‘DEFINE_DYNAMIC_DEBUG_METADATA_CLS’ undeclared (first use in this function)
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
> > 
> > I wonder what this error about undeclared macro means.
> > 
> > > > note: in expansion of macro ‘DEFINE_DYNAMIC_DEBUG_METADATA’
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > note: in expansion of macro ‘pr_debug_ratelimited’
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |         ^~~~~~~~~~~~~~~~~~~~  
> > > 
> > > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> > > any additional argument, which `pr_fmt` might add.
> > > 
> > > --- a/include/linux/dynamic_debug.h
> > > +++ b/include/linux/dynamic_debug.h
> > > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> > >  		dump_stack();					\
> > >  }
> > >  
> > > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> > > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > >  	static struct _ddebug  __aligned(8)			\
> > >  	__section("__dyndbg_descs") name = {			\
> > >  		.modname = KBUILD_MODNAME,			\
> > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > index f594c1266bfd..5d701952e739 100644
> > > --- a/include/linux/printk.h
> > > +++ b/include/linux/printk.h
> > > @@ -742,7 +742,7 @@ do {									\
> > >  	static DEFINE_RATELIMIT_STATE(_rs,				\
> > >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> > >  				      DEFAULT_RATELIMIT_BURST);		\
> > > -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> > > +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\  
> > 
> > IMHO, this changes the existing behavior. The prefix added by
> > pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> > Is this intentional, please?
> > 
> > Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> > need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
> > 
> > By other words, we newly pass just the format "fmt" without the parametes.
> > The 4th parameter was added by pr_fmt().
> > 
> > 
> > IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> > BEFINE_DYNAMIC_DEBUG_METADATA() and
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> > to accept var args. I would expect something like:
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > ...
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##__VA_ARGS__)
> > 
> > 
> > or maybe, we could "eat" the extra parameters in
> > DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> > DEFINE_DYNAMIC_DEBUG_METADATA(), aka
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > 
> > 
> > Or do I miss something, please?
> 
> Don't think that will work.
> Won't you end up with ".%s" fmt as the string without the extra argument.
> So you need to keep the expansion of pr_fmt() together until is is finally
> substituted into a printf-like call.
> It is possible to enclose it in () so it is passed as one parameter and
> remove them on the final expansion.

My understanding was that the format is stored in the metadata as is.
I mean that the string is not formatted in this code path. So that
the parameter values are or can be ignored. We just need to make
the compiler happy.

But I might miss something.

Best Regards,
Petr
