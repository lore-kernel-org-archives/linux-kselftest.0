Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034F28DB54
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 03:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836810; cv=none; b=ITxB2CyiPdKZCRsAUv7c7n+ze0+Zge2Ucn2l1lTUecUmAyas2LygbhU2ZXC24Thw7JniFu+N2JvyCHdz+1xiRGZE6BLKfoIvi3ulDdypI4QSqhYtopLuNSkOeNWYjkITBrFKwmR0fWq3b8mE3haChwyo2tMXAdreRzTCASrsg64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836810; c=relaxed/simple;
	bh=ZfxXtFIDZaxEaB2DZZIymB/sPhHPfXU2HCfAD7m370Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAuSVNhtenZLD2rWkH6UV2bdJE7fYSG7LLlhQmV2G58rww4zl0JebyEElBSuey5zWQ9A4+Xw6SPFobPMffClh1ueWaYQuOceeGMZm7WHM0F/htrAoLodNGPd06LSzsBdKSf6UF33uD8BmwumrfQYyqI9fwkBJHMNaj962GzflzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i01aQlTL; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i01aQlTL"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3693487a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788836808; x=1789441608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=12p4lFRZRGzA/IYQV7hQkbzRDXwADtGkCvDmrb2OlJ8=;
        b=i01aQlTLNMlR+jcgeYe2V/PIZR0nn1Lqt1uUHbJIeLI226Iv5CTIhYOwqB0etXmTWi
         0P4vQnuroo65v1rA+ICr7pHFL/oBu/A9i5TUW+2NHIwXQ2eej6Dy3urrh27HMTTbb5lT
         HRAzp1EkUmGmt7Y1hyDRHDgz97FxT8B/Ti8mgtWtxhDKwrCUU2EWbkGkTUrLCe2bA1kR
         gqh7qz94GsUby5mcqaLCGWs72BkSqqPKpHD6sm15IhUBJ/voukV1SunFga1p55mv+G+t
         kmxf+AwsSrfWsgatYJRYhqVmqvDkwRclkivdahJAPh736ETYQs+XDc6BHDaDQ/5oGZuq
         GNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836808; x=1789441608;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12p4lFRZRGzA/IYQV7hQkbzRDXwADtGkCvDmrb2OlJ8=;
        b=VBkN5IKG52IuDePGXoXS4o7C8U0uVuHwSqTmo2EbWvNlacnMmdbBA+ONiOgZOYea6p
         Q1yjFrs5gt5NGdPbT36T8xUhODhJWrZ85wcJhXfFnEX2elHhVfI3JyrvR9zHU1C+/ZSU
         3pYNgSw4CisIYBpIVKeFC9MHAZP7C5KhxgdKIpukjWCLaRBCzP0opQo9JScovT5AvZ41
         nJkWPVUQHIqqMfJep+6GsaBIe4DpG3lB431dve7IgErA0ybJUvEuw77F2As4lr8ZLs/E
         lx8mZrmrgyG11XUZrgcNlOe+6fylYy1O4GFs6j4CMVYX8M67MfMp+TWNCezkt5nslNei
         se6A==
X-Forwarded-Encrypted: i=1; AKwUvBxNVgDm0vutJMOgu8dL2SzJMaDX3PRHLsIpx/6QsEKQ1jF4UHyDoLT2X5fIppdq1Reu7d4F1CNQ+8Q5B1rOmkU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ2p1IiBk6ssLrLiWI/oR/zd30HsmvpuMNKbbslpmBmVNA8OZK
	Dzz14DvHlD7L79b6TT8hNa1VJYW+yXdzRwOlq6+aiT7qS0BtFM6/NNrA
X-Gm-Gg: AYBFou1fTyrsyphCdv/PeB2P8Hr8s0XTQreJunc0AoGCaLLcjZLfBI6huGBOzSpBUJn
	h1Mo5cz2tugI8OXtOy5fLbD0xxokekovmPXfWich+6SCYvo3KAvhGUQQIFVBcOG3M4rIWUlDFxl
	WKP3OrUCNVpQuhSgEExrXiwtzF9lyeKAswSrEpJzW1lIf+qv0LJ+xsg5HlZEQIlM6RzUOxA2Ao5
	ik/1vPqJ+yTG5tdMPjQsKbCpmStlaMmi83rppUOBJ05+8Ok7+KTOw8bmrJOmdhhGOdtfK27MeLo
	g3XrYqqiYHxa7F+anj+CDjHeW5mKKHQnbRdF0rdhASh7Q7SPB7aj01nwBjItmU0pJwt2q19uyLD
	auesWKa6L0g/3r7OvW/H4km4gLUrDGaPOg7toomU//hBgQ1S5CcTvqknLPoMRrRVBSlsXzZBM/1
	f0y4THaDVBNHAyoL8Hx3Ko2n5sX1DwbUYPObVlNgjwlLOWkJov5Hsp9QvXHxTmvGDiY11Sp65O/
	mo=
X-Received: by 2002:a05:6a21:e081:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3da39bb593dmr40716679637.2.1788836808060;
        Mon, 07 Sep 2026 20:06:48 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:3fb3:b562:896c:1ac7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abaa2sm4390883a12.23.2026.09.07.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:06:47 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v6 1/3] trace: add lock-free stackmap for stack trace deduplication
Date: Tue,  8 Sep 2026 11:06:24 +0800
Message-Id: <20260908030624.1300-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908102140.2ed161f1c851d94e1365520d@kernel.org>
References: <20260903132409.270195-1-lipengfei28@xiaomi.com> <20260903132409.270195-2-lipengfei28@xiaomi.com> <20260908102140.2ed161f1c851d94e1365520d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 10:21:40 +0900 Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> > Kernel command line parameter:
> > - ftrace_stackmap.bits=N: set map capacity (2^N unique stacks,
> >   range 10-18, default 14)
>
> Ah, this kernel cmdline parameter is also be a separated patch,
> because this is not fundamentary needed.

Right, it is not needed for the basic functionality. In v7 the core
patch hardcodes the default capacity, and a later patch adds the
early_param along with the [10, 18] clamp and the memory-footprint
documentation that goes with it.

> It is OK to use an official address for SoB, but to make sure this
> address work, please at least Cc to this address.

lipengfei28@xiaomi.com is on the Cc list of this series and receives
the list traffic; it is a working address. It will stay on Cc for v7
and any follow-up.

> > +	if (!smap) {
> > +		seq_puts(m, "stackmap not initialized\n");
> > +		return 0;
> > +	}
> > +
>
> You also need down_read(&smap->reader_sem) here for serializing.
[...]
> > +	seq_printf(m, "success_rate: %llu%%\n", successes);
>
> and up_read(&smap->reader_sem) too.

Correct, this is a real hole. Reset clears next_elt and the per-CPU
successes/drops counters under the write side of reader_sem, so an
unserialized stat read can straddle it and mix pre- and post-reset
values -- for instance a non-zero entries count next to counters that
have already been zeroed. v7 takes the rwsem for read around the whole
sampling and formatting block.

> > +	 * At bits=18 this caps at ~135 MB. The file is mode 0440
> > +	 * (TRACE_MODE_READ), so only privileged users can open it.
>
> Hmm, this is too huge to make a copy inside the kernel.
> If the stackmap is only increasing, and can avoid resetting by
> reader_sem, what about rewriting this as a raw-output mode of
> seq_file?
> You can use seq_write() to seq_file buffer.

Agreed on both counts: the copy is far too large, and seq_file with
seq_write() removes the need for it entirely. The element pool only
grows and slots are never recycled, so an iterator can walk the table
in index order and emit each populated entry through seq_write() as it
goes, holding reader_sem for read across each pass the way the text
export already does. That drops the per-open cost to the seq_file
buffer, and the header layout and version stay as they are: open()
counts the populated entries once to fill nr_stacks, which is a plain
memory scan of the table rather than a copy of it.

One caveat on relying on reader_sem alone: seq_file releases it between
read() calls, so a reset landing between two reads of the same fd would
otherwise splice two generations of the map into a single output stream.
For the text export that is merely confusing output, but a binary
consumer would silently parse it as one coherent dump. So the reworked
export also carries a generation counter, bumped by reset; open()
records it along with the entry count, and each pass revalidates it and
fails the read if it changed. A reader that raced a reset gets an error
and can retry instead of receiving a spliced dump.

Pengfei
