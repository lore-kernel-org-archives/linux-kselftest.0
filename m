Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934732;
	b=g3Mnwck3R+EDL2qWvH55163Um2W1Yf8qnmGhgNsNFN1XHoh0d5tuKBXkYoPa8Qv/kRFc
	 74K8jAisjDoQSsd0+3B+NFd+3YFfDLl6RpQFsiqoaILc3A9QSXRgVbuAHmT/Jnav7zwHQ
	 HKRveCJLFjUG9dM2aaiypxqr646M8vZmmVqfs/pNlcqZlZKNRXzExu5icUo96ELYnqneg
	 v7VBrqa7JlTFimW4plmvWwzWB8jeqIa1qy2xP6Q1oRl1RNPOZGHwuINaQILZrby2rwTqf
	 5LKxSRW0HwBpCZBwI1csaGWXxk+b7xYBQO20mynYjBC9ScIApeHic0uC93XohAIOHwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
	b=EWZvdk8sdNiP48ookcLAfIGg8cjQa4xca3JawPTCZIW073z18BtGhUT9UdVqcaeqkAAV
	 XtrNZ6rh8Z8i766lmAkRNMy+ELwgH9uWQ68FGqd9KMKjITICz6xTCVb8Yk9LVGfaj8KKa
	 qBGjy70lR/rK/BqBX9LPl4cffY7BmvtK6R8swPsbx5pDIq1nduR+xGLeEoVrYP/Nxorvh
	 nTnWLUbIrPq91uCsH6sn2fsEjyubUJ2vFDfZU49DeJRoHIMW2Cx2/iXPtYjEuwacO7D3X
	 jYA+VjwysIxPft811ba7UHGqZylKD9I7ga98CUJweR5pp3YPvD8ac/B6mnsJ/AF7sWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7FC606A31A
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 13:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ba8fcc684so22664256d6.3
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 06:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934731; cv=none;
        d=google.com; s=arc-20260327;
        b=IQ0c+79q86SWrUXtMELeWbnAv4YfFZUck1qlhEMXeRbeVsRC+LNaTiOzlT3N77j6qY
         DgvrSaWPrUPyPhv6S8lyFY8kF2J3J2PuRiNv+Gac0a3szxwEX9Xr4BviQPgMZGIyXWtg
         hzxoC1tlSVJyFY77UZl40q9b+ZoOwfYM660lT3hY8OkInBPlsLQ71tBYFkBI7kt23BYh
         fp8GdQNrlULYAbXKdv+GWFcs5hthAacCfqr+7oroZKAlZEs+uDNwhX+MBASvfFJyUAEv
         sdm4f2+j8aD5kBnXZ87GxURx0A04TclGd44D8Dexy1gy+rHYrYGN+2pCt3Q5sT/Da3SM
         ewgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        fh=kL5i+C59/0u+DPASg+5VIe2RDyurdwsx8oFWQ+Q6wVw=;
        b=ZTSJnzgA26VjDkp2itNEcVn5msq9f7sWqdoSlmfYRueGYwMCccAg30pzxAE3F87FZw
         lPj7EoHxv+pMPZPwPRyuIb4gYuj1GkyKGr/TUHGX3Dz9tTFIFToREdcrG4xDEq5fL01O
         TOJDfx5HmBXRcrXRAAX7NwMPalaHubMXuMwzTPmVu6HfXkkz9tL7udktNwsplWgGscQU
         zW+jNnJKKEmeTEhu8Bft+5RCaGnaCBae/98YdLfr6+iCEjHxkET/M2iv2nLJ42CfB/61
         uedoyTjysp4XpVa/yb82eIrVcY2CUFHozFgbqd16fvmvxKlVyDiaadX7sIDKQ1lo8gxD
         BT6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934731; x=1793539531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=EHrJZaLt7VtHx1yPQ10O8lA7efwKTyBBrss4U2TzyzskcZWD/Cl1vDMWLSemzmGcSy
         05pxNF//4W5lw3GnguMsycI1rXKU+yVLV2WQ0ZOWd48jO4wHr65waWsdjrqxm58RM4NU
         W9RmPpCzZS4d79Y0NBPb/wChJHF3kDBY1B3/Logmoe4mkOlsV5NES9XQ6WuZwFIVGUwy
         BCbTn/cPLibvdW3WevChQIYSS+f4WJN7IUoEX+/ZdPO/S+WbIwfoec+Pyz1hOM58DajV
         lKkztwJvGAo7pd5IXqaLpkxdK+KIuQuZfR7UDO6kZD2ZlpyuGWUAsCw6/siT57GKeir+
         Rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934731; x=1793539531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=Bcec+EOZB0oQN8eUahHlQXfOs+lkskpZII7sIR2d2yp57nAw6KUy0hmxalgf8H5BSi
         pu8IHkMZYCCPBJaXJVCsXBVWXBzySbXBzJWronzprAAzsVNkrhDRXlFyfcxWYOu2C6oi
         wSka2c4sgpWOpGnUBigIWwihlb0NNAkkrPfqUzgJjvrOAGjn/dNDVNZh+1JLxP647AbF
         ZXzx318XMpiHJKmzJRYI/WSZY0Na4nsssCnubLUX7yr9fWAkRpI3nvDmpoZWFmzxr69n
         z+eXHikPBoOar377qv6BERWb5brFftImjvi6KmS+dYkpw3FDw7mKsqNzN5sBv4zFP7Ly
         IgdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM1W1zjmLWF9BDskuysW1Jbfxhj8+68gPFWFUJir5hRXmEGA5NcmdXn6KiKeXGzFfrki1MxJM6bdxeJqxOXZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYINwAW7YhJoB94AyhDTCwuDSfu476JXVKcu/xpizyzf9y2Bo6Te
	9jcVwmYF752nUkJUfvoUyxHAGmsmN7uRUjq53uyYV4TdnlQMgxVbIHE5QNGzfcB/xRk/Hqu1Pzy
	CyX2tuuLvC24rFEsQvlYnu7n8WGVB900=
X-Gm-Gg: AYBFou1K6oofzdpFHqCHr10OMtnxY2R2FqNzYl32eprgDyFnBs6klnk1Q/1MAdyIg87
	QtkgsI2OPFUnj95Aj0ab4NRmzrR+v4VQDjqe1oo3V1S/YOG022ORlmLDeHkaLnVPT+tb0cH+J2S
	beNH4vaJxftVj+2E1OS+coCLJZcy2ZwHfRLI9ZQt2oNbC/5LTWbY7i33KGn5NnE+jvt/4q1aF3s
	tiZjzKhecgdnbFKE41KRolc/IWT2twdoOueHMWCsSI2eLQnP/5jy8BiOGZ9yPDGZkVqtiJDRZXF
	0VxKaW5iGVHYweb3s8WGahfGqvU8MpYI5ADdWRYOgOQfw9W4fgeOamUaYhOo2Hwvnnq9JX3NVjh
	hiNV8hyk8oAZUXPvBpnCBHae6HvfPUvAYGQSoKyQMMQk7LnS8ob8xlF+n8xkgM8IntRayG5Tfz9
	BDj6Ov/ZZ1wcBRtNotQiG36io1yj43++ulLXfJjuEEbaGzgq1qgG2ZRkGJV18Ya3RMpyew5G7s
X-Received: by 2002:a05:6214:76e:b0:914:4376:4ef8 with SMTP id
 6a1803df08f44-91c48d17173mr71961046d6.6.1792934730661; Sun, 25 Oct 2026
 06:25:30 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
In-Reply-To: <179250646543.2190262.8632957027583518623@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:25:19 -0300
X-Gm-Features: AclHuK9kZbLYrL_1P7Nb5PvMxv1l7G9aeHa0aDH5ksgUMzl9ooOaFs_24PQ2VeA
Message-ID: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
To: eugenio.zuccarelli@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Eugenio Zuccarelli wrote:
> +- ``--summary``: If set, prints only the summary line for parsed test
> + results, rather than the result of every individual test. Does nothing
> + if ``--raw_output`` is set.
> +
> +- ``--failed``: If set, prints only the tests that failed or crashed, along
> + with the summary line, once all tests have run. Does nothing if
> + ``--raw_output`` is set.

Hi Eugenio,

Thanks for documenting these. I compared both entries with kunit.py and
kunit_parser.py and the descriptions match the code: --summary silences
the per-test output and only prints the summary line, --failed prints
only the failed or crashed tests plus the summary once everything has
been parsed, and both are ignored with --raw_output.

I noticed two things while testing the patch, in case they are useful
to the KUnit maintainers:

1) With the patch applied, "make SPHINXDIRS=dev-tools htmldocs"
reports two new warnings, and that file had none before:

run_wrapper.rst:331: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]
run_wrapper.rst:335: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]

The continuation lines of the new items are indented by one space.
Docutils wants them aligned with the text after "- ", that is two
spaces, like the --json and --junit items just above. I checked
that with two spaces both warnings go away, so this may be a simple
fix for whoever applies the patch.

2) "Assisted-by: LLM" is not a tag that Documentation/process/ describes
in docs-next, and
"https://www.google.com/url?q=http://checkpatch.pl&source=gmail&ust=1793021034312000&sa=E
--strict" reports it ("Unrecognized
email address: 'LLM'"). Documentation/process/generated-content.rst
asks for the use of a tool to be described in the changelog instead,
so maybe the trailer could be dropped, or turned into a sentence in
the commit message.

These are only suggestions; how to proceed is of course up to you and
the maintainers.

Thanks,
Daniel
