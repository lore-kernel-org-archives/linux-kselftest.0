Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9498446B4;
	Wed, 15 Nov 2023 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JXGh2R8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57FDC433C7;
	Wed, 15 Nov 2023 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700080683;
	bh=5eg16USqvNaKaaA4DIa7tqsKS5quRcWMm8E2kIBwP80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXGh2R8dYSkXy4/tfhpRmglE3gjUfBOEmmWRHdfHUoxVvLGYp1mG4gwPbBYSmu/mE
	 E7JcRm/+taw+/mGEs9wWNqvAwigLvx5F0rdPCD6i6ckZWSS7fdfaW0dU1hRGM9hpaC
	 PUvtkY7rYAEUUvJ/BgxD68XhxMSwmvKOdUsi6VyA=
Date: Wed, 15 Nov 2023 15:38:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: workflows@vger.kernel.org, Joe Perches <joe@perches.com>, 
	Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>

On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> Introduce a new tag, 'Tested-with:', documented in the
> Documentation/process/submitting-patches.rst file. The tag is expected
> to reference the documented test suites, similarly to the 'V:' field,
> and to certify that the submitter executed the test suite on the change,
> and that it passed.

I'm not sure it should be a tag that stays all the way through git commit.
How about making it a cover letter/first patch footer?

tested-with: <suite>

-K
