Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365851D45E8
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771892653; cv=none; b=YwzsWU1vYsEuIDe8l2V8qUcAhUj9ifR3ddze8pRAWjMWoRs01VcpUiuDK/PSjqbPssAsUvKl+12JPnwOBimw/c2x2VOxwFwjLG93CNFhluRwWMxQtamXK5dL4HLke8a1oWV+u8i23J4tZQ2ZGOWKVmkPSKbH51ADvWLFio9N2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771892653; c=relaxed/simple;
	bh=jKHWyDAu0xJvzI3WO6+meQgDEHUikzp88qy14INmcPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj3f1MQ0BQFxc83pyinSHOOVEV2AORNvFOACs3J2b52ZKJnBuH5p6WnLhX5QIAEQBlH/nFi2L+RADBXorNgR4UFb1+0vA21e9uGoH7h7ABl/OyTiXa9AMe8xSccd0SK4DDxMhVAY43C4TwKssW98W/tJIQXWmAhywk7DM8xAZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpogB9XA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpogB9XA"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7984d31b895so11978647b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771892650; x=1772497450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1akxnV01TuuqkqVdn8oJReBwARp0bMrNePNSdt98A4=;
        b=GpogB9XAYZVLqYAmNIO3FrVFQhmoujs+FpP+4b4mJiQxMSpUhpo8OwTsalI1EAz5ur
         FDKD6SSIPbopYVEceVSXKj3gzfrTiKdP0+3Ub6uiMB1ddrs1Fu+cK0zFxTWqfA1p8xWC
         txJfEn33rZ6JzxMxxuA6/QrDQqfcZRaNXpgcgCSmInhIkhcmYhgtfgA8Gid0msMlNcXz
         JKBczHy9aVSGRKZKrxwgLCBLNbVUrbZHlQHqRTPyxUdV3UJi+dkZe8fwFoAsw3Jk/4Oz
         UTt8OAJtk/+0IWTu2oGeGp+fgfSqocrq5h519eM/4FaHGro3RfgStDuRzcEsOwR0S3oc
         hl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771892650; x=1772497450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1akxnV01TuuqkqVdn8oJReBwARp0bMrNePNSdt98A4=;
        b=EdQaZ71XOwbOeLR2UTVX8Oq7eipmKqKKdm8sI8RSkFBDyAXClrNdFFlK83hMby0uyG
         /M2iB2o3GxBklGNjAfw0vUWBnehhEL50pk4gUckM/5oCiW78c/hbCOycq50ftXSx8g8D
         Ggf0XxfIc33cwG+AQGFMDLV/wXz3PLUieVS2KPcceZ5nufSHgKzT+gdhbVmz8uokSy6u
         0mMUHnV+BYtUXgbrGHqyxDtNHXnwZ0+RBd7DDrMmjsny3SUGn0Uk/UHNOlgmC5ziOsrv
         KGNbY9y2regMJ0btpIohZ3CLZ1ro0QFsKB/2tGho55jDSDzw7LG9n120UNoL1Rg+c/o5
         glCg==
X-Forwarded-Encrypted: i=1; AJvYcCWlNeDG5liy5h8ZyLfW/27rm9QG2/aJaxXEUHnXkwb8xL2QXRPomO0mEt2k80rze5mQxxpXlXtnu8msHJzWUyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFz4ym7MRLKgYJkTfbJ1fK7GDG7mjWPtyEaDvyW6M3Lqj52mCb
	FBdRw4WipAgaeC+28fVnfUOunbgbtnvxaJyrVOp5+AD/NQkGlWlRY9ig
X-Gm-Gg: ATEYQzyvmJ8J8HrMeklNUdi8hgTlur3mUGzA7mz91lZ5a5Q5kDyE6S9gplXUkd26Fnx
	rNWQn73w9kp9HJtogoVCA2kU1JH+dKvSBlnCfnm4UJMYotij3/RMLZUXU0YN2Z/YzyIaX4SHHVz
	8L04aHTbnD54ZVgu5giN7MAd6Gn1kymGdPI92eNXWvpia7dn6ofelX/dMFWgaJgTfmFb0WJa8v/
	70qU2oHFRimbsVxcUDOtGLQzOyO6pg5/pVvMjXTAQxuM4CX/gYU75EyrotoOwtBREnKu3YHbzGn
	BZdIU9qTjtfHivXtEh3OXh47yUXUaer2+V+NhHxlPCJpKrdp/g6WNsehhynhRf9J45/OsEuyjXh
	W5MuII5Ipt97tn8SYgJV8hXvjbw7xRW4+QQlcFKm93olRLARL9y8OUtz2wPvzx4XYiljWjJnrE0
	KDsIz0wJ1jNWvIJFDi55BXWmDL9mSCGt+7joDkTtj6GO7VSqM=
X-Received: by 2002:a05:690e:4149:b0:649:4906:770a with SMTP id 956f58d0204a3-64c788d2821mr7812527d50.8.1771892650119;
        Mon, 23 Feb 2026 16:24:10 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:41::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a35d839sm3891935d50.13.2026.02.23.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 16:24:09 -0800 (PST)
Date: Mon, 23 Feb 2026 16:24:07 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	kuniyu@google.com, ncardwell@google.com,
	Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: Re: [PATCH net v3 2/3] vsock: lock down child_ns_mode as write-once
Message-ID: <aZzvp52L4smGF7cM@devvm11784.nha0.facebook.com>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
 <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>

On Mon, Feb 23, 2026 at 02:38:33PM -0800, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Two administrator processes may race when setting child_ns_mode as one
> process sets child_ns_mode to "local" and then creates a namespace, but
> another process changes child_ns_mode to "global" between the write and
> the namespace creation. The first process ends up with a namespace in
> "global" mode instead of "local". While this can be detected after the
> fact by reading ns_mode and retrying, it is fragile and error-prone.
> 
> Make child_ns_mode write-once so that a namespace manager can set it
> once and be sure it won't change. Writing a different value after the
> first write returns -EBUSY. This applies to all namespaces, including
> init_net, where an init process can write "local" to lock all future
> namespaces into local mode.
> 
> Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
> Suggested-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> Co-developed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Stefano, I wasn't sure if you wanted the Co-developed-by and S-o-b on
this iteration, but I added it just in case. Please let me know, if that
wasn't what you intended.

Best,
Bobby
