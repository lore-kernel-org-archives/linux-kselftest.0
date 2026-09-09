Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF521ABD7;
	Wed,  9 Sep 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942214; cv=none; b=g/6IoLDZF4nzG5ge/K5SJyoGuXlUWcYYZlVxZft1wCLZ0gTBCuHFxz5hgJkHM3tOjD+Vw4i37BPUV+d4ZTOrgr3abJo/ki7mxk+YjVB9eS47+FJTuPGI/keS1R24uhk4aMJnO/JQl5IIFHmMscgh5ZvqEnpIMwchRlhQj9TTs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942214; c=relaxed/simple;
	bh=vHJmTZylLwLhIJs/y6kh9pnE14zh5au4EY7Qa0uPYHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6k65z9jbrq+97AIgyDz24V5clAsLM7v+UFkt7nilJww1Iku9V0CyHrhzQyHNhMAKl60zMQ2CA/lm82/f22jVyr5fwgrZkvZSu6ealFlBdtF2N0CmtYOQwzEti6M8gUzTKXqvoiN6HWZ5OO7b75opqSoq1VSax3tRi9VsXmlUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYS1BbcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYS1BbcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4881F00A3A;
	Wed,  9 Sep 2026 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942213;
	bh=vHJmTZylLwLhIJs/y6kh9pnE14zh5au4EY7Qa0uPYHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYS1BbcQ9irCMuvn7iN87hzXktBDCMA0iGDJln7lvC/BsMzUsbtoXohiujOeR/Zc3
	 aZiUkb1sdPIKYrN/sf//WMHyUIjbMlzLwO30rNiXaDog+gHLt/z8bQbEjmhfqOYazA
	 7ViFxDeZvDAv7Ph5L7F5FJ7XhOksZrIgycPEGPW4olyf/u8Y063rDpCu2AZgovoLja
	 dsCnz8ioLUpXuhHbBWBYmO00M1k2zpiH5UpDFaXnAou3dtCqHybkYs6jhPf0Z79Iua
	 qifO47KNnDHtaVhYYhO9qHgWzNL+vjS6VewUiLNoNH4amLLtbqbY4mZVZfOtg3zaIL
	 75IVJUzXUTpHA==
Date: Wed, 9 Sep 2026 10:23:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, 
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <20260909-steht-nahelegen-zutrauen-7eed38304a5b@brauner>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
 <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
 <aprVEyqOrdmuD-HN@linux.dev>
 <2026090456-unblock-elixir-7d4f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026090456-unblock-elixir-7d4f@gregkh>

> kernfs patches go through the driver-core tree normally, not vfs.

Ok, I've taken quite a few before not too long ago. Do you mind leaving
this set in the vfs tree?
