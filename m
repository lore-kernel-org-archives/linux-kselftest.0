Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B63435BDDF
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769884683; cv=none; b=r3+g1aSg8SvrbVYwMM1L4t5Flv0IEVL5eZhorPvBxyN1tYY+kUWBwqwC2z/aw+be2maO+5/WlitkjdaGZ2iOMNOVfe3JuVT8vGPvc1NBrCvahfVnLGpEUcleiCYG0yEn7FXUxPEKgK1kXJjridROcoZaMrHuXlglkZysWJqsOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769884683; c=relaxed/simple;
	bh=eQO+qr/OAGr9BumSBlJp5RbhUoi9LqCr0xzqBeub5g4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=CqHXdTmnXX4VZ7zbQUrcjWApdJbgB47/d3OXBswNLL/2bOYN6sQp3wP3Gm6wxRUcxbtiHcrubEGi50YMeH35u6pLI9JuuC9bpKOCuH5inVufR1le30Y6SeZrSOB4d9VhoVoBAeVbElUvTOLlVlqsNdPKntQBJa09HVIo0HYiVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff+QUqlx; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff+QUqlx"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649bb5a0c3fso239441d50.2
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 10:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884681; x=1770489481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTDA4EVY1dnSx40dh4iSEtt/xAzscLfbujiihQuN6II=;
        b=ff+QUqlxZktBpcFgaxIRBYpmf/MiVlduPaQytdwY8X7/sLXiO3FUeBR6ANBRKBXZiE
         BfwAfYfMAsKkIs3Tmq0hoQP8rFSRV7khEeVyzcO7FgayplnfG8FigTaJ+vxDIDmXbx+e
         WutNRTblft6QgAZOzbQO6yTCG0bw/A7Eq4/W61z4P8sf/sxwLDwAmNedZeK39bUgAIld
         tW6GLaN3+UOJEXvEVq/WjfsZJP8EcxWWQr8TnR9URsLwok8KIu3uETsn/71Gpozyocr1
         W3pPy2I32OgGf7uj4zlpC4hV81/8WRdLsb8dB7U25qUhhz5vPP4JQ87WOY2c87PW8Oje
         gzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884681; x=1770489481;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTDA4EVY1dnSx40dh4iSEtt/xAzscLfbujiihQuN6II=;
        b=vV+Yacmtl+C8u8TZ7Kc4RGVzDF11FLVaAa0uiJxdtETlLZGt5eiC0Kc3dytuJBSh2o
         Dk4hdQRmP9qeZCly6zDnsR9VaIHEUROIwpCocOTIJfuxU8rhnFwLOdn3jNXOHxVq5mT1
         vU3K+46q+8TLrTQyEltbANfKJ0Fh4XezMjBxBhIwx2otIwKxRymIO+1XmhdDDlyvTXM2
         QBzbvPmzcGRoVTdnv4EzkiJyTUw9lDxhP2Y/pmDRwI6UjzeWJnjvxpCXBqOtfK/YCX0Q
         ZEAamoPtEXP9o4HqLSAtr1vs4VSdLVhdllMBpY/4N+gzJmJ3RdQpGchUc/IWJq3Rq2Z2
         l6hA==
X-Forwarded-Encrypted: i=1; AJvYcCUajlF+lkOoKvg6lYa204Ej2e6oUob9aNbCUPwInP+ay6AoOw6opAN9EwMqVmZ5Lv/xPR+VkjHfQI2r4K6hm90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcG6TfLDfF1RoKR0TfIn2n6q9SQ7aAc0i9C1YqmdVJhb9yBjz5
	PJUSWlcCyUdSkKbNGw2WshaqA8UmqMPHftpBBetg5yTnBmnj72B3ezoM
X-Gm-Gg: AZuq6aJw35HSPbUPk8PsZDSi0dl/AsX86jD6nWDOhYaiHUxIEuhwA8FYxCB2XdeUtpu
	wwvgWo21pQkK+Mnnshz17jdeTDOal4hIv9sFVUUHLnyH4pXtz7dcRv41SPNz/c2h9HSwk7a4s4p
	ykIWOT7P2frMmXYmxrPBFmb7tjIQoPTbCK9qyVjX77ABFsqdihVWAskW9dkvDbv2HYwdNG3irCQ
	DiFhLIKJKXiGZnn5w3iHNNn6uGAwrExwL3SRSZC1QrK3XE0Ty9xebmITk0jsk3PVTLw4jfCx2yD
	7lmOQgrUOWb+f9U+VXehC9kFVqtuI+imNBJhkBlV/saT0Mb9dVXqRrm5AZ5fWrIMvTqxKJlktCE
	TQ8hV3fTmjzdwfm/qrMJng4K2xj7NLCVWsaXRhGG4hvTItnSZkFdGDu7zu9paHQoZJBCiubUQKp
	VUMVFGJ9iNt1AjrJ14PXmTmd27dfqb7j8DUGXMMX6Aw0zz8Rky7baoGHVg6cI=
X-Received: by 2002:a81:ee06:0:b0:786:6179:1a47 with SMTP id 00721157ae682-7949dfba546mr42643307b3.44.1769884681521;
        Sat, 31 Jan 2026 10:38:01 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-79482766c5dsm48500557b3.12.2026.01.31.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:38:00 -0800 (PST)
Date: Sat, 31 Jan 2026 13:38:00 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, 
 netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1c864b559c885@gmail.com>
In-Reply-To: <20260131095047.2096ac8f@kernel.org>
References: <20260130192912.826454-1-kuba@kernel.org>
 <willemdebruijn.kernel.29ba7c9e89f32@gmail.com>
 <20260131095047.2096ac8f@kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: rss: validate min RSS table
 size
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Willem de Bruijn <willemb@google.com>

Jakub Kicinski wrote:
> On Sat, 31 Jan 2026 12:18:55 -0500 Willem de Bruijn wrote:
> > > +def _test_rss_indir_size(cfg, qcnt, context=0):
> > > +    """Test that indirection table size is at least 4x queue count."""
> > > +    ethtool(f"-L {cfg.ifname} combined {qcnt}")  
> > 
> > Remind me: does this work with devices that advertise RX N TX N rather
> > than combined N?
> 
> It doesn't. But I haven't seen a device which doesn't at least
> advertise combined made in this decade. I started typing this with

I was indeed thinking of mlx4 as one example.

> support for "rx" vs "combined" initially, but it complicates the code
> for no real benefit.
> 
> If a driver which doesn't have "combined" starts reporting results 
> to NIPA I'll care, right now - CBA.

Fair. It's good to gracefully and skip on older platforms.
I guess the test does that by virtue of the KsftSkipEx if
combined-max < 3. Ack.

> > > +    rss = _get_rss(cfg, context=context)
> > > +    indir = rss['rss-indirection-table']
> > > +    ksft_ge(len(indir), 4 * qcnt, "Table smaller than 4x")
> > > +    return len(indir)
> > > +
> > > +
> > > +@ksft_variants([
> > > +    KsftNamedVariant("main", False),
> > > +    KsftNamedVariant("ctx", True),
> > > +])
> > > +def indir_size_4x(cfg, create_context):
> > > +    """
> > > +    Test that the indirection table has at least 4 entries per queue.
> > > +    Empirically network-heavy workloads like memcache suffer with the 33%
> > > +    imbalance of a 2x indirection table size.
> > > +    4x table translates to a 16% imbalance.
> > > +    """
> > > +    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
> > > +    ch_max = channels.get('combined-max', 0)  
> > 
> > Same here: not all drivers set this.
> > 
> > Perhaps we should skip if absent?
> > 
> > And does combined-max mean all queues across all contexts, or per
> > context?
> 
> Could you rephrase? Not sure I understand.

I implicitly assumed mutually exclusive sets of queues associated with
the two contexts.

If max channels is a driver global limit, then cannot 
exclusively assign max channels to both contexts.

But my assumption was wrong of course. Multiple RSS contexts can have
the same queues in their indirection tables. And this test does not
include any flow steering to an exclusive (set of) queue(s) for the
additional context.

I had not previously given any thought to how additional contexts'
indirection tables are (expected by the kernel to be) initialized.

> channels are interrupts, we use it in place of max Rx queues because 
> we don't have an API to allocate queues directly.
> 
> When queue count is changed and the user did not set the indirection
> table of the main context the main context's indir table is auto-
> -repopulated. It may also be resized.
> 
> The indir tables of additional contexts are not repopulated.
> We do not have the concept of "default" indirection table in 
> an additional context because it has no practical use (just use
> the main table if you don't care about the queue selection!?)
> Since we don't have an explicit API to size them, (yet),
> we expect the size of additional contexts to follow the size 
> of the main indirection table.
> 
> If a table is resized the expectation should be that the driver
> folds/unfolds the existing table eg [0, 1, 0, 1] can fold into [0, 1]
> or unfold into [0, 1, 0, 1, 0, 1, 0, 1]. Resizing tables of additional
> contexts is currently broken / no possible. My colleague is supposed
> to be working on fixing that but appears to be making slow progress :/
> 
> > The test seems to imply the second. My intuition was the
> > first. Is it clearly defined across devices. per ethtool_channels,
> > seems per device?
> > 
> >   * @max_combined: Read only. Maximum number of combined channel the driver
> >   *      support. Set of queues RX, TX or other.
> 


