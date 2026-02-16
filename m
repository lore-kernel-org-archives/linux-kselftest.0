Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC031A051
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259271; cv=none; b=W7XLMPZ42I86JYPXTVBBB05K4eZjJjJXhWjFnkmfhqQPH9HlX27d9zTQ6JZuRamj//JA0Y/ttiiGEVoFIL6D2XfhL0leTsedTnH41raGDJcM0uUQMbmsbFPU8NdIyjVH4j1Z6AMsxY4zXZKd1/HuEzv68fa3mNX8SxKgQFyrco4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259271; c=relaxed/simple;
	bh=uK0yhrheAWp+1HFKdzB6+HC7KQxXpCfeyD8TYNIEf8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWF/M0gOPWJAwhHnR5yvYsFtxjU0byEFP2UsE/3thnH0Oh1p3e0SwJYtuL8lUBFdggCA/aZfVygQtzs5m8vCB3dPII29YCPyhxtujaT6UkYtdo3vFGnZ7eoCKcp+0BwiGtjp2WCO5SGdBLdoOhg+MDKfTDHAE7DddARCrh7x/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=az1dURk9; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az1dURk9"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48378136adcso17039895e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259267; x=1771864067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=psgHVJWvQ0vhmy9UM6Py2oOFm9j9yzqcdlkiRgF10nA=;
        b=az1dURk9nNMb7qsEIG9PFsFwoF40lLEMZz/oFpjHBz2RUWCvpYbBTyA/V6CT9iQwCT
         dEzRMwv/RMbyqJjGx3Z3vubPjMlgCAI30Zphkm7XbVci+XHrXsIDP9MnvYRslvNr7Fs4
         sdlFd+F2axAcAnAc+BWE6JO9fsGNGgG9HDD58EhtD4LLfMnJdLz0fQzm+OZ5i1Zvo3pF
         UsExNfdQohCyh2CmCC1SV9XmTanmt58Dnye7gvEMhyNp4nUzoBxGma0YG/fB+jOPHSyf
         z5I2qRsJ4r1C98y5T8oola3HlbM/XfL6o7NlTDt+PBjU8dN8LwuCrZ820CcmgO5JWQ39
         0Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259267; x=1771864067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psgHVJWvQ0vhmy9UM6Py2oOFm9j9yzqcdlkiRgF10nA=;
        b=ldOXOWKt62ddLWbOjULp8zaivqVZRiy7uuzhz5vHDgb7j1rvm9Lpo8Cme+lAZTmcAW
         9nDpZmK6EpLwdQpr/bF9HfIGqQU3cSIgnLaFB5uTNDWpb7wDfB6SlGTvOQe8mvYchX3f
         mCE/mCPyuVBdP2JGIrrbVYAMUfllYcPgQ2V+zNiu7pLHjL3OtmmTZLr0ij+r8CGwdkqa
         nDs8a7P2Ynp/jfxDrpbDeGd9eZj5npLyBZZWvV3bXVSiZDQLfGx/wIpbLpUmxtXWMMun
         DHKsPjGOoZlmdh1SiuDI3BS2RFbSoID2eDOvDfQVGGxqIeQOYYnHp66za5nhQcHxCiys
         OiOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQeOoO3KrlNTzDAgOshEBg1JnAeJ8Yt2wvBmOeI5VnwYTL0l/qFnqCiyoYRhMXz2uINnFmeq3NuigxmXCNvF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cozaEzn0FJnF28XbPdzvz6jp+dpuHAoHze3fwlSJ48aC2NCc
	1J01oNHxki0S7rW4piS7iCVttncDtyVBudXT/0QPi3yIo2g6bUWMFHBC
X-Gm-Gg: AZuq6aKV7Rb81kyLCIzmGNvhiDdgDpNo6QKwoDlJoqfoncTo4ItZDYwGfGUEZdYw7m9
	+x8yJcAT4c2rQwK4tY2iVrS7SGQv4ThFRQrHl5zIL1PeJhioBRqDf3TJUZOHWKRBJFgX4QqVU9z
	XX0R0O8EI6C0foROJtBR6Lu6cCxI1iE78VfT1PvTAtMENHuiebKBJFGpFkLXeI6uje6eLOxdFuX
	AqumDz5+Rw+iszH6Oxkp75HfhTkLtJv8KVIJ1PkLSgWnMXc/+0B/TAMql0EayOu4eyFXx96Cyxu
	W1b2qexocfWksTaxrv/DI8yO0cPGZkmzICL9QF7o8fp1CrNVO+gm34sU5EITl8RFoFo1kVB6jRg
	5OOEAhI5kaeAbMbD/I9e0hQfTIx4qcnQ9kVMASSEoQAyMgExAwHTm13C84xRqc06QbUEdUfiz85
	wyfsW6vDcZK4mdbx+dgxnhbFXl5k5/NXP0iWZimeMIwxAOVhbH1M8SWZcJ
X-Received: by 2002:a05:600c:1f92:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-48379bfd727mr142402445e9.17.1771259266651;
        Mon, 16 Feb 2026 08:27:46 -0800 (PST)
Received: from localhost (bzq-166-168-31-253.red.bezeqint.net. [31.168.166.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm441915175e9.14.2026.02.16.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:27:46 -0800 (PST)
Date: Mon, 16 Feb 2026 18:27:45 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, jack@suse.cz
Subject: Re: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
Message-ID: <aZNFTR_gc6j116rw@amir-ThinkPad-T480>
References: <20260212215814.629709-1-tjmercier@google.com>
 <20260212215814.629709-2-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212215814.629709-2-tjmercier@google.com>

On Thu, Feb 12, 2026 at 01:58:12PM -0800, T.J. Mercier wrote:
> The kernfs_notify function is hardcoded to only issue FS_MODIFY events
> since that is the only current use case. Allow for supporting other
> events by adding a notify_event field to kernfs_elem_attr. The
> limitation of only one queued event per kernfs_node continues to exist
> as a consequence of the design of the kernfs_notify_list. The new
> notify_event field is protected by the same kernfs_notify_lock as the
> existing notify_next field.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Looks fine
Feel free to add
Acked-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/kernfs/file.c       | 8 ++++++--
>  include/linux/kernfs.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index 9adf36e6364b..e978284ff983 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  	struct kernfs_node *kn;
>  	struct kernfs_super_info *info;
>  	struct kernfs_root *root;
> +	u32 notify_event;
>  repeat:
>  	/* pop one off the notify_list */
>  	spin_lock_irq(&kernfs_notify_lock);
> @@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  	}
>  	kernfs_notify_list = kn->attr.notify_next;
>  	kn->attr.notify_next = NULL;
> +	notify_event = kn->attr.notify_event;
> +	kn->attr.notify_event = 0;
>  	spin_unlock_irq(&kernfs_notify_lock);
>  
>  	root = kernfs_root(kn);
> @@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  		if (parent) {
>  			p_inode = ilookup(info->sb, kernfs_ino(parent));
>  			if (p_inode) {
> -				fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
> +				fsnotify(notify_event | FS_EVENT_ON_CHILD,
>  					 inode, FSNOTIFY_EVENT_INODE,
>  					 p_inode, &name, inode, 0);
>  				iput(p_inode);
> @@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
>  		}
>  
>  		if (!p_inode)
> -			fsnotify_inode(inode, FS_MODIFY);
> +			fsnotify_inode(inode, notify_event);
>  
>  		iput(inode);
>  	}
> @@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
>  	if (!kn->attr.notify_next) {
>  		kernfs_get(kn);
>  		kn->attr.notify_next = kernfs_notify_list;
> +		kn->attr.notify_event = FS_MODIFY;
>  		kernfs_notify_list = kn;
>  		schedule_work(&kernfs_notify_work);
>  	}
> diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> index b5a5f32fdfd1..1762b32c1a8e 100644
> --- a/include/linux/kernfs.h
> +++ b/include/linux/kernfs.h
> @@ -181,6 +181,7 @@ struct kernfs_elem_attr {
>  	struct kernfs_open_node __rcu	*open;
>  	loff_t			size;
>  	struct kernfs_node	*notify_next;	/* for kernfs_notify() */
> +	u32			notify_event;   /* for kernfs_notify() */
>  };
>  
>  /*
> -- 
> 2.53.0.273.g2a3d683680-goog
> 
