Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F813BB125
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309790; cv=pass; b=Ka+CwxZXn0KiUcjGvf+HdIUpkn8tehRcui0UKAwj6mPSKiyqONhj534kYKV0oig81jZErxAPX13Pfqa5U1JY1nWAXXxiEOVnSzAd709FjL28Th55xVqxhTg/jjT5XcP0ZwEW2z1VG1Q4Uc1jxpCNc61gast79UxujFuork7HIgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309790; c=relaxed/simple;
	bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNEskCTdSN6BFzS6D9m7ehguj8CcMRMMWYP+yMwpQl9r+UIbWppMyRnOC/lRJW8DyIMu1GjrhElOyll1eOv0u3xWbOSk27Lu6e8cPQucsJKRt8KXHFryMpZkiMPtioXuoRWVatgb+PP7Q+6XrL69Vz/+ENZbdZAzb8wgMw4m0DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOD/uamh; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOD/uamh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bf42b0ad2so75144eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309788; cv=none;
        d=google.com; s=arc-20240605;
        b=PtP3bJQxiCy33NNg9QoorKpbAdgbM5E/XsAohjCCdtkbhJ6KCxvb0c9/HTTSZSKRAs
         5dWom0kyQE+WF9SvgYjb/g83kbpFgnsQrvxkBVEVstZNGKFB6qvQE0flY6s2J6roWgxr
         iBhMbMQh4B+H1It5joY0u4+45YLiODqUTRtTvh//wYmqZtjOKFyowffs/mqgvnSkCBCw
         lfugBj8tNnZAAA4Yz4DyEW/IDWylpiBA7EGyP7Sb1cZKxm0NGdirqampXfRwTd6SvRaA
         qalde6pAIpmtFuhENLzX8Snf99A1ET763A1+Vj6qO8BgrvwHoJnCdpHN5tlEMyXfj1fg
         gf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        fh=U+2KMe5VeNmMvK6DDQ96kj0Y969T++5/hTFWHsgCcDY=;
        b=HencGjFXITHqCPB43OKrQmXff4qsjSNS0l2mlZUzH512Pnc+muoWR97sKqhIhM9Xsz
         bU16Y4msUTHJJI+EdId8Xtjsk/9XgESoXzZv78N0rVyK9KKDxpaBk1q/LHzNw89PyGg7
         2AIPPixZE1807VnNXCosBGTn2cUwQr8Cs2HP4+1msXntgarNLrKyWLj+Q7lzSa66EImx
         m051ubh2w7uEwU+Tu/VNNnU5lkflXlFSukLSkH5G9dC33rrOotmj//jDzeCguNfaJlgp
         lOLb1W5IF4qXfLNSXI1QqeImQgnkw1Fj673ZLLLVULrQrpX0s42RqIHE7sqZfNd8MXuY
         VuQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309788; x=1782914588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=bOD/uamhEpcZJyswv53R84IDRMeI6M5+ChYBgjLyvLfT1fQ65r7lzzwQ1gmCC+wuEn
         2vpGRI+m5uC/gsBm7DblfDULWdfIY9ZSe05VXEG08w57lGrNtLwN60ZcYfsqhVWvylng
         bWEK2eVdZJ0Tmb5pCGX3UXUiIh3E+i6++a9NhVOOHmx/n5nJ0rOXw2ASWQ9fgoOTVTCB
         3/28G0P4l5fMK7R9as4EUjduvq28vuDMkk4OmSZZcOF7jdfBx/hM62MM+5WWYAjBBcyO
         /vcLrSxb4845JDcnkXx9wDzYjuWeHm0U98NS/Wqidu+uHZFS1rgP3ozC2XHYFw/vXnIx
         udvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309788; x=1782914588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=DBXVeBXwrlP9OeuFcGRmkXE+RNjtWxLzMMyUqMZWg6URlmZFxM/zV/9r5gxbh7ZG/s
         j2oM0cSMJQJ/yNdrPlfs/0bw/1k0FOLUL5OgAwum0FzV8/7clceb9sB6nZPbExcFB+4a
         4qg+mJtCYg2fyBlIQnampKpvNeCu+o7AuNG0Dw45xQN7RZHcZuQ64d/yBIxocTpXij79
         SyvQ/0CnfWXqBfkPhbdN8kvQB8rkWyy/Kc5A80BHMWNvQML7EY8zdrDS/+AT2lL5x4Xa
         qvfCCtooMSMTR4zDr26Z5y1YznPEoZHj+sXMKfPk3wh4/wM2l9KG8UGU1Tkw7izO//fJ
         Iq0A==
X-Forwarded-Encrypted: i=1; AHgh+RoW4/soQ5WKM9b3xwK77doxkMVnqMXi+yZOxTctM98Y0dbBnDAWH3MknuUyWmUqeQUOL/wjiho/1pZNf6Z/cSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtU9j///y2NPb8HcITyM7bAPmgfYMKTrYnwrav6pI6rAF5/+dF
	21435UDCghIot8nIhZEYsfds8SHzwjAhR3g3qLggx4BxcpfoHrZ4S6+tuuFI109pVVI0uYmpI9j
	FtkV8d44IPaa/x0qRk6ImLR3SVl5zkMU=
X-Gm-Gg: AfdE7ckzmbPH2lJvejTYfT8UGQf8zHmE/xAUbgxaz92sl3egRxrAAo+XsuGfBkR9yzF
	d7JX+SHPQRjChPcJth15wCmCzkhpNO+X+qkVrtb09pN6usBSn3Nunitn3uWuZfhfYNtnYq0StCV
	7UKH/0GoB3P3mCwf6tuQqV6ZAQSWoOWZAWtNI2zAnpqczxcBg66ME11ftkfmCbaXhTz0YPBJuMo
	+bspnCLdUJYXaBC6FwTevJ5IJgqBxLucFaIUOAy7+flPSx+T767t78tFY2UEUxQlUESS5OZDVG5
	Wp89XwWyIDMVraZxtu4HgxNkyuJO/9qLwgRFZWLKbwcO28Bdp81dDg8n0ZBhzoGJ9QVvPOQHnP7
	yqI5HjZh5ZMDs
X-Received: by 2002:a05:7301:658a:b0:30b:c8bb:588f with SMTP id
 5a478bee46e88-30c5240f7damr3538472eec.5.1782309787929; Wed, 24 Jun 2026
 07:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-fix-fops-owner-v5-0-aa1cba242f05@linux.dev> <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
In-Reply-To: <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jun 2026 16:02:53 +0200
X-Gm-Features: AVVi8CdZJD474qdF4GDgFLlfJ_vD8WsFaomaTI3YSRH6pluhcoRUR51gh_iz4VE
Message-ID: <CANiq72m_LakPxHt99+3eBn2rXokr3vZbdJf=Wk-Yi8_ufQ2mvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Fix missing fops.owner in Rust DRM/misc abstractions
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:23=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I would only suggest adding the new file rust/kernel/module.rs in
> patch #1 under the MODULE SUPPORT support entry in the MAINTAINERS file,
> similarly to the other module-related Rust code, so that the module
> maintainers are emailed when changes to this file are proposed. I think
> you can change the existing 'F: rust/kernel/module_param.rs' to
> 'F: rust/kernel/module*.rs'.

That would be great, yes -- thanks!

Cheers,
Miguel
