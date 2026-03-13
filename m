Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24AF36E467
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390733; cv=pass; b=V73wyqQmw8+tVWiuIey8yavoOMPt9n1GCrxFnar8QERpxJlBdpXyx/KE+wo3VOqsQY7rI5StnLDL6fArLMxx/aBNKUbaIBkhbqE8Ks0/g4ASzOpXwdAzzBgBvjvDR98WLLcep9O6BAx0iIa9r60f1DljOq+BDG+z0qD1qdBH7AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390733; c=relaxed/simple;
	bh=73CFgCEKHFJELY9UP5/RhebVFajDLrcQrE0lsXPbdIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2YbTeYjV9XBo3Nh81hhasHFf3BdU2Om53Phg1Dh6w/pXZ2Eq/XhRBFldkoYClgvIgbyzyKe50DI6prhbNSzYggQGYL4HSgT/Q0WaBtsgM7yzLwA4NrsnxcZ9as05YOAX9xsPaw9x8vZTufoeC8a44YTu5c0ltASeK45V1oqcMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQJMmXtD; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQJMmXtD"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509069a7a7fso391371cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 01:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773390731; cv=none;
        d=google.com; s=arc-20240605;
        b=L3PBmgObqhDX285u/Ny++Vwcf7T9yjmyf7jS0Ybi4KdnHYqtJc9gt/rQFHBz5PfbTM
         RVkdodedkIK96KR1k8hZqUYM5LTgbxABAV2WOnnZi6HfGvLUZ7muveSbCyxgg06SaNH9
         fy0TRtNmq5azrN7g7/t/kxPwNo0QU5Uj3U4V21ZUU/Th72l2AO8BODoiSrEn9l0ANGjw
         4SD2bE08AuB+liJf1TcuezAkzAuBoxIiLLE7mdZDbWhlcRGYqeRAPilvmyEUR/oRr0AW
         rA4UUBCag84vljSAP9k1JW2U7+9lP5UCY3AWyjVcScORyUSOcRohQk0rxCDaRMT3e1di
         5i2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ZginHenLFfV4BXN5/Mah3uAKtVZ/csIYirzOzG2w24=;
        fh=09Sy19N137aHR/thwFNBzBRk5pdmngN5qHZjdNzT2gU=;
        b=SqcFNkhsbx0yLgn3zcOcHdAsE5rgPwjAbMzyymwU48vjaBai0DmqKudhScon7gUJXZ
         as88XryeQNrfzlyZyfaU8m/cmbqvayxkrCIqRkv1vuBPbRTlnOqi3G+8GhWTibHBGluq
         h/l9OzSs3CqO8kFYfoXt0k0e6SOVLndAwBaQHnngWmPokBApLH3U7LUQI8z/0YeX+uEk
         BvXuF+i2g7SQrDK/QPWeWaF+yNllxmMhxGvrmc+VgAKCf4tQllR2dY+BcYkyOl3fzdEL
         JvBcPmgZoRovXsACPOJWku/Zo1y5yqKwxax3u1WJ5rWhCg6ka4ulv5PvWsf3PqFxoDTb
         lWHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773390731; x=1773995531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZginHenLFfV4BXN5/Mah3uAKtVZ/csIYirzOzG2w24=;
        b=nQJMmXtDeSbfqyR+LkB3F6MP0abezHJlWnsMbWoEcXY08iHzHCjQhwLMn8VR4iT2Be
         G1UgMm5hGMR3gYMYgmgkeR25dFtszddTUZNA8KbWejU6Qg0bU6y5QU4ORGPkXuJSWgdL
         qF0bNUYpsGBcQsDCD9VCFAx8lIRtDxgdSh9W9HQrqGJFElIOD/TzbthIFloS0wM57u0Z
         quzVdUomwO1CWThAvGKXHVUhtRBgezKzUsbQRN2pRl9u8QU58pk9XVuVvuJUsevLO37B
         /2oUkr+FqlOR2zNGSgeYYq3id7E/zCJFtLM+z9d6ojL5T/PvKBMvtY9I0pHKEDDVyg/a
         +l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390731; x=1773995531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZginHenLFfV4BXN5/Mah3uAKtVZ/csIYirzOzG2w24=;
        b=YwfvFYUyAEXWFOi6shrrZuD4klmsyNgdb2cZaZx0wLKaAEbUe8wYKftP0RM6lUGzKI
         IxrFyzbLEpqydy5OMpuFsTV2EmghJAkdxFYYP2FQpF/y+5Eat69k6rIjOGPsZCongG0d
         dSzdV/BuhdkCJKN6+hV6Qz95N/v7AajKktLfu2YR4I3Ey6TGmf4HNVD4P0gjTTFXIZcg
         dbQhO+qBv95Yliwuxx+IyRb1MqXRkt7b2J6AUzrb0reRWQEP64LtWs/V1PSmkksG6klx
         CTPo0R9rOg0HFz4vIb9RWQICmV0/Zvd+XDz0Oc8w2ZlUdQSIiu2Wk7TUVou7R3lbg1L9
         2PwA==
X-Forwarded-Encrypted: i=1; AJvYcCVlWT9YYWcFUvIhdDNvNY9w6GFkuUyDCb/vjT8T7cbNcHILMWxeEU5wpRhRbUNx6SpKmsYQKUjt/rU/F9y1ofA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FjsAatAGHBGnWgfPvodD2O288N3/1uv5l8QBOAycVoonJ74X
	+YljFAv/jb4P7+cw6NlhMO7YvQlxLQFTgs/IGJBD0+9WU10UlGLK4l4Q069o0Atrg33l78xDyfp
	177MG9pqw/V42s0pcZvWBNNtlY7mKy/LnG55Zb77+
X-Gm-Gg: ATEYQzzscNqmN55p7HHRN2NQYmbqGh7lGUX4r2cr91JC1RxZoXshablPpT9Z7zJtMDQ
	Vz2zDSNsJohY7u8Uy9WqfGZ7LVGksEEUIWDroqqrWjcJPmZQ1lYNIsjJ2MQpOCP5tLiHVIL0/+Q
	CvaMLcRAGQAf+uko28rgC0Ht/d328aOdmInkN3Ix+PuZnsnPNpy4cdTdqKdCSQ9iVar1kXuacUR
	QdEkq488/LvmQKrLre/tMXuAdUJwC7atgXQ7K0ZJImCg5roQpo9IA8hTEFlyMPD3WIjn0jCZHxJ
	SERtUcFt
X-Received: by 2002:a05:622a:58c:b0:506:9852:75ec with SMTP id
 d75a77b69052e-50959e1d20cmr8206111cf.9.1773390730313; Fri, 13 Mar 2026
 01:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
 <CAEvNRgG-L+GBcm+u_thGvXAxV-Nqzu5VtgXy0PfND6SG0FiyVg@mail.gmail.com>
 <CA+EHjTy2urW2Tj5czQDKUHdri7FCLfw2mafTgmmtFs+-7ueoiw@mail.gmail.com>
 <abLfWHf89TxWqeGZ@google.com> <CAEvNRgFUc+9xCoN9Yo5NThHrvbccWAhPwp9nNM2fvx7QqrcJsg@mail.gmail.com>
In-Reply-To: <CAEvNRgFUc+9xCoN9Yo5NThHrvbccWAhPwp9nNM2fvx7QqrcJsg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 13 Mar 2026 08:31:33 +0000
X-Gm-Features: AaiRm52mXTtSsie7DL9lVs7x2V-5c-a3ZmVbxJyJb1VBocy3h5inh1iSGtq73Is
Message-ID: <CA+EHjTzJmJZF=XE2NWsTZ9yCVix8oLp6M_Jb5m2EuC-W5p+U4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng <ackerleytng@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chao.p.peng@linux.intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com, 
	david@kernel.org, hpa@zytor.com, ira.weiny@intel.com, jgg@nvidia.com, 
	jmattson@google.com, jroedel@suse.de, jthoughton@google.com, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, shivankg@amd.com, shuah@kernel.org, steven.price@arm.com, 
	tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

<snip>

> > By default, KVM makes no guarantees about the in-memory values after memory is
> > convert to/from shared/private.  Optionally, userspace may instruct KVM to
> > ensure the contents of memory are zeroed or preserved, e.g. to enable in-place
> > sharing of data, or as an optimization to avoid having to re-zero memory when
> > the trusted entity guarantees the memory will be zeroed after conversion.
> >
>
> How about:
>
> or as an optimization to avoid having to re-zero memory when userspace
> could have relied on the trusted entity to guarantee the memory will be
> zeroed as part of the entire conversion process.
>
> > The behaviors supported by a given KVM instance can be queried via <cap>.  If
>
> I started with some implementation and was questioning the value of a
> CAP. It seems like there won't be anything dynamic about this?

We can drop the CAP for now. Probing via the ioctl and handling
-EOPNOTSUPP is entirely sufficient for the VMM to discover whether
ZERO or PRESERVE are supported for a given architecture and conversion
direction.

> The userspace code can check what platform it is running on, and then
> decide ZERO or PRESERVE based on the platform:
>
> If the VM is running on TDX, it would want to specify ZERO all the
> time. If the VM were running on pKVM it would want to specify PRESERVE
> if it wants to enable in-place sharing, and ZERO if it wants to zero the
> memory.
>
> If someday TDX supports PRESERVE, then there's room for discovery of
> which algorithm to choose when running the guest. Perhaps that's when
> the CAP should be introduced?
>
> > the requested behavior is an unsupported, KVM will return -EOPNOTSUPP and
> > reject the conversion request.  Note!  The "ZERO" request is only support for
> > private to shared conversion!

I think that this makes sensefor the UAPI. Returning -EOPNOTSUPP for
shared-to-private ZERO conversions.

For pKVM's specific use cases where the VMM requires a zeroed page to
be injected into the guest's private space via attribute conversion,
the VMM can simply `memset()` the shared memory to zero in userspace,
and then invoke the ioctl with the
`KVM_SET_MEMORY_ATTRIBUTES2_PRESERVE` flag. This completely offloads
the UAPI from making guarantees on behalf of the trusted entity, while
still satisfying pKVM's functional requirements.

Cheers,
/fuad
