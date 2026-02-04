Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4838B98D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237968; cv=none; b=V2wqW5Fb89zsIGyWr0kFISXTjLvv/6eAKtig2qpXxYHU9691YJFm+NdpzRiR12hYrtQMX7HpG8schF5qGw/Ed5ICPRLA/xACFutvFs3+SMuiwCIjHDCMoZRWkjpnoXc2loBsH04vbyi9hv1JFn4apZZbH5ycOtvbPbWR161w6HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237968; c=relaxed/simple;
	bh=qWOblQYebZr3b4DNcrCHxa/N9wKXw3nJYtVNLvKaaQY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=R2VuvyrJ35EYNp98N/azLYsbPEFsq0QV4Ll2LRZprhLWpHlV+BbtXlsf211yq55Uhq0jz+uMTKDsq97j5rwIytMa01wI3WpDZOtqOM+YWbsrwjgSu3RByvLIkiNpVsXfnh0nbXXhLBbjgD5uR/1ELoYQYmJRCz1FrNTlaUPkwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLm6F9P7; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLm6F9P7"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-7948e902fadso1963717b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237967; x=1770842767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lv3YIJDutvl3nESEPNZZVBaLc1dGe42cfk2JLGqHhBo=;
        b=TLm6F9P7ldF+YU8Rwy9dxlZr8s/xBXZTQegnDCJjYcbJSfTUyGrO369x6qjkHLiAPz
         mbQvXQv+K488XglrsyVPQKIEAZPX0hfZqTwxs57R0vmJyeE8Ycjqeo0UWAFXM3cWvH5n
         w6llfBE+zhA7RxgdpLT6WjGazLzV94I5cx8xO9m7DYg/QlufefjL96Wf0LLnHJE/G93B
         HqJOeapor5LJrsSPqp76wAGjh6hBcZMkWo8s4SdD+7H8mM2BK3/IAc1WlLjH6j8waZKT
         Absn6D4bknL/lRkzXLIct1s/RZkXKSsWV1gtHL3FgKZn6rjGUP9QCvURd12cb/Vjb63y
         UdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237967; x=1770842767;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lv3YIJDutvl3nESEPNZZVBaLc1dGe42cfk2JLGqHhBo=;
        b=iTcwZQPFZmyuGcnXmHEZUme4uyVtucKUQUp5bw1axVUqVTj69PGC4agUI7YjQR47jD
         5OlbFPQvbfc0+BCFdNc0Jt/KoSFfNXD1J5DaoE4B94DlakBmj49HtReLq3ju/X+Rs/iy
         9Mm0MhQoityg/p25HOjNsYtT8wsLAjvcZ/6EjotvG2FoH+WEA3qDjljBB/E+NjiFJq9X
         146uaNk8AeOLMmckjW738cUwCNvC5r3M9/lLsH4UDwcEM/2Z1TAC2Z7jWKhIwQzloxr9
         Uq1DyBh9yJaHWI5WsxT90sYD6PY0knr9SwPo4HD0R442pQuRPCiz3B/d4gA4JzlLOqic
         YrSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/udSwXJMQBsJXyQg48L9vKgl9jYDRJZREMdrRUgrYrV5YdYyREy5fyof5R+zfIUkvKzQMWDJ5zZxAG5UoF04=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcz+iqh7wFl+pK3dcjEIn7g0digM56JdRge6Fsbja8bU5VXnF
	OticQtxIamjNovN0OMsgjX0vbWGtaWmAT7/dsm33aY7qIGlKMP+jYWvF
X-Gm-Gg: AZuq6aKZAM2jOGUhI+4oF7/ZOP+2OLR9wsTM47D7Q3kMcBSKIucETbio0aM+IVm9ke0
	wgkN/hEyIWmwbh+BMRF7t7qa/ETA1VdCr3GnZQN6avEoXuv+Tb3UUtXwyuWInPgMiZqQWwuNFMu
	XJIxhGyuozD01CmP+FbNOnko6Oi/9H/ofxINRtvjI9vvspyIZ3by3uewoD40v1l0MxKWM8cMxW/
	JbHNSYTgHqhxrEOmFFb16s00loGnqiPEnw+4BzBv+P5Y7JMezBUrnzcTACL1Ze0DfuzIx1QmeRQ
	hPbF1a3V6NomaIBBgWbeII7Jte79k0zv33qiVUIgAlUTgEhW2INA9phWWNP9jEY3+9hauos9w2B
	8z9kurdUuOdx6XU01QMMRNbT2dHOtMTmKhfaBJscbhWkhSuPc5kfr6pg+OSZRG2r7EVlO4RY4OT
	GzZAmYxviHs601k6qOx8bpC/JLBrPLPB4t0NoE3rlaYaGiOsHK6PlegX69jPpOKrpxLQCpZQ==
X-Received: by 2002:a05:690c:883:b0:794:fcf8:f822 with SMTP id 00721157ae682-794fe651c96mr39194847b3.7.1770237967533;
        Wed, 04 Feb 2026 12:46:07 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-794ff0144e9sm30202817b3.56.2026.02.04.12.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:46:07 -0800 (PST)
Date: Wed, 04 Feb 2026 15:46:06 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <willemdebruijn.kernel.26cf34e993f40@gmail.com>
In-Reply-To: <20260204-psp-v1-2-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
 <20260204-psp-v1-2-5f034e2dfa36@gmail.com>
Subject: Re: [PATCH net-next 2/9] psp: move code from psp_sock_assoc_set_tx()
 into helper functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> This commit is a pure refactor. Its purpose is to lift code that needs
> to be called from both initial tx establishment and tx rekeying into
> dedicated functions.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
