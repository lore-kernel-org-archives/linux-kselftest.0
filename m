Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D43B0AE3
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930442; cv=none; b=MA6KzmdMy2Pp3D5dv65cd3DWcy+FeFoxE3GcT/MKe2kAV+WSLdv5BYbbQ5FYqri+klaKeecVxlUnaQaCizueIhpThLo2m8iZjIIy/jw6H3qj5GCe+2xHUUyHYNYZwHCPgfkp/szGGzzifbyETrhuO7+v7gMmfa8Jt9Jbg3b/08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930442; c=relaxed/simple;
	bh=IE62m8iSP+rZUY8t9Usf2nywYiJ3//tW/RHG7c6stSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EOl+8bTlVxZzwtMpMZg2DMwVNDKfumL+XVDoALxoTUmZCcY6vgOKPv6yce+QtB+CEIDatuz9Z8AHl1x5AxmAJR39NA6iJ19cJqLbros+uKCGSb2/2w2YiNoh4m0XcnHBpkKS+M9bsZIjU5Rqz1kpl3/4XQOVPYUpJwGkaSQZiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dMpPHE7o; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dMpPHE7o"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49244130073so29365505e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930438; x=1784535238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzA7AdLdyanHGDYnO7UeyFW4jvO3vgqbYi0TkaDMqeo=;
        b=dMpPHE7od2YOc7JyBd9MJbNSdEtZzgfKVioldewuTPjyvB03ym4gRs8/wL7lQ1Cetm
         ueXamYpq7WBcSbWz/S8mzE3/fiv0R54Q0kKksTDr6QJhAf1NJmXUyGLeX+T46ji881xP
         mfQXi4Ijj64GnfVlRf5mmP9bD2boxI2euSNoNrGrTm2rrHSnQ2NfBC/iNnVc+B4TOXKh
         f4ZcT7JXjLqHtGEUc1I+6D+sImN7adruv4GRxAvz7w8HfefFJvsrgD8u7g+iVmt3arev
         sCVDm7PxuMsEfegYPaKmN81lpQkQsnFBpdVyZQZRmWrSUxgS+GL/xQKfYXvMr5/wWvGe
         3ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930438; x=1784535238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzA7AdLdyanHGDYnO7UeyFW4jvO3vgqbYi0TkaDMqeo=;
        b=aVWMdfe7LhpIWEibVNEOfIsDmDMfx2YhLgSBdaLkmLH5W0co0XAJwxFVJ4yMXcHJnx
         vbkbgupc0b6negONm+vFSPazXKmba6YH38C8EDRwCrvem85l7N7q1DSL9ho1MMDUs/3y
         7ZmE8nqUXWM0p2NrwmXrD4FhatL5oE926SufaXUcqn94VSU82kT5ZjsZRYWk53VmOt98
         S9a9YV4ONaFfxTA6AhYVrl9Npi/hd69RyFBYgzIJb0Kbl2WNn7K661OBPHkbxq+IEz9Y
         OYBXYl3a0rcGyQe+M6a43C8H6Tfu7qDpTfZXl98CQP4dwjSJ1cG9InokQYaChKoYYLKP
         EqZA==
X-Forwarded-Encrypted: i=1; AHgh+Rrdlo6rna1dXdvgvdC17oVLjC6LfVTKpwjBB9beRvguslSkP43AoNubSBcT7vB1ojpq7u9qm3dIGLzkAp/I2tg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5DBHcqMseU6hGfpucvf41tvRs6rHBy1tacD7tqYahzETslrU
	lhEs6yoVZPnM66MgUBcHr6Jk5zrXUhShZxAm590EO3a4Hx7inhjHX886CvzGkO7Ldf0533saQWb
	Ogi0dD3w5/ypnw3htkw==
X-Received: from wmbje14.prod.google.com ([2002:a05:600c:1f8e:b0:493:beda:c864])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8710:b0:493:e81c:fc9 with SMTP id 5b1f17b1804b1-493f87e5198mr88665935e9.15.1783930437954;
 Mon, 13 Jul 2026 01:13:57 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:13:56 +0000
In-Reply-To: <20260713-fix-fops-owner-v8-8-2495cfa82d47@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev> <20260713-fix-fops-owner-v8-8-2495cfa82d47@linux.dev>
Message-ID: <alSeRIaps6QSqxJE@google.com>
Subject: Re: [PATCH v8 08/10] rust: binder: use `LocalModule` for `THIS_MODULE`
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 02:45:29PM +0800, Alvin Sun wrote:
> Replace the `THIS_MODULE` static reference in the binder fops with
> `this_module::<LocalModule>()`, consistent with the move of
> `THIS_MODULE` into the `ModuleMetadata` trait.
> 
> Assisted-by: opencode:glm-5.2
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Most other Rust Binder commits use 'rust_binder:' prefix rather than
'rust: binder:'.

Alice
