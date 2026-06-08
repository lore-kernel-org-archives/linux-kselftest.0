Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FA2C15A0;
	Mon,  8 Jun 2026 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929122; cv=none; b=NDsHtl0bJcqenstnqIjgIzdc6CaniLFS7v6EFJzRROgIxSBziKqZTlSm4YYyFY3tYfF+GMutzBO5JKvAO0yYb9z4B3JN/dSmCeXunwjKtwLus4GW3YPjTz+QYcTn86jijBK0k9n5SxzEh1vxhlPiGEUbW37DMO+Y4Jh6ywU+Kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929122; c=relaxed/simple;
	bh=Vq+kfKcSNF3flf3Wg99MwCMYVyrrBvEwo9miGVees8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lBqhD9RtF/vhhXqPZZ8vLJIkSd4z4p4pbeudONgnN/oaMqn2vE8WTdJo+ntORIXxeyAQBhTp3ZOY+zKTrmF6owhiB8EwemT3/wJ96MM+9X6AH9rEkNWbApA7bZDDi9jS0LndXJLRS+/QTeURimL8VLtlWZtWEJARlDHe9ScfZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSFVhS4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSFVhS4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A171F00893;
	Mon,  8 Jun 2026 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929120;
	bh=GXzhRNmiyLzV5XpoYdPWmv4GRg29mmsANh1qKiJSDnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dSFVhS4iS5L53nJOdib+8Ww+15mnqO+ql7RkXjQFHQCrei1fnAv6HT3kBq/HsakmR
	 IAwQr2S4GYxPLM6HCqjO2SWAxzuov2TbvDaZ5qiYQ8+ROqj7B0hzX6ZOMuJ+gYwP1d
	 SjCiVleP4P/rRXqcPhWY4TH9T/pYndqaCm7EBs9zmWRaccbLyz1bJBu2TCHWL0Cr0V
	 DzLoQtsjoxS2st1Lf8dDzZD+Z4FOn92S++Acw9jaozOzb5/oOKogBihKbuQlXvrYQs
	 E5Ry3JyB2KNFc/WeF7gEGDXOlQTaM+BQVyssTX8Id4PBav49gJPYdqJ5ojJPZco+qn
	 FwwyCqjR8dSzw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com,  rppt@kernel.org,  pratyush@kernel.org,
  shuah@kernel.org,  dmatlack@google.com,  skhawaja@google.com,
  tarunsahu@google.com,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/liveupdate: Move luo_test_utils.* into a
 reusable library
In-Reply-To: <20260511201155.1488670-2-vipinsh@google.com> (Vipin Sharma's
	message of "Mon, 11 May 2026 13:11:54 -0700")
References: <20260511201155.1488670-1-vipinsh@google.com>
	<20260511201155.1488670-2-vipinsh@google.com>
Date: Mon, 08 Jun 2026 16:31:57 +0200
Message-ID: <2vxzo6hlt86a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 11 2026, Vipin Sharma wrote:

> Move luo_test_utils.[ch] into a lib/ directory and pull the rules to
> build them out into a separate make script. This will enable these
> utilities to be also built by and used within other selftests (such as
> VFIO).
>
> No functional change intended.
>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> Co-developed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/liveupdate/.gitignore |  1 +
>  tools/testing/selftests/liveupdate/Makefile   | 14 ++++---------
>  .../include/libliveupdate.h}                  |  8 ++++----

Nit: perhaps libluo is a bit less wordy?

No strong opinions on it though, so I am fine with anything.

[...]
> diff --git a/tools/testing/selftests/liveupdate/lib/libliveupdate.mk b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> new file mode 100644
> index 000000000000..fffd95b085b6
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> @@ -0,0 +1,20 @@
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH ?= $(SUBARCH)
> +
> +LIBLIVEUPDATE_SRCDIR := $(selfdir)/liveupdate/lib
> +
> +LIBLIVEUPDATE_C := liveupdate.c
> +
> +LIBLIVEUPDATE_OUTPUT := $(OUTPUT)/libliveupdate
> +
> +LIBLIVEUPDATE_O := $(patsubst %.c, $(LIBLIVEUPDATE_OUTPUT)/%.o, $(LIBLIVEUPDATE_C))
> +
> +LIBLIVEUPDATE_O_DIRS := $(shell dirname $(LIBLIVEUPDATE_O) | uniq)
> +$(shell mkdir -p $(LIBLIVEUPDATE_O_DIRS))

Sashiko complains about this:
https://sashiko.dev/#/patchset/20260511201155.1488670-1-vipinsh%40google.com

    Does this execute the directory creation unconditionally during Make parsing?
    Because it uses the shell function at the top level, this directory creation
    will run on every Make invocation, including utility targets like make clean
    or make help.
    
    Could the shell dirname command also be fragile if LIBLIVEUPDATE_O ever
    expands to multiple files? Strictly POSIX-compliant systems only accept a
    single argument for dirname.
    
    Would it be better to use GNU Make's built-in $(dir ...) function and move
    the directory creation into the compilation recipe below (e.g.,
    @mkdir -p $(dir $@)), or use an order-only prerequisite?

The first one seems to make sense. The second one not so much. The third
I have no idea. I don't know Makefiles well enough.

Perhaps worth a look?

With these comments addressed, feel free to add

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>

> +
> +CFLAGS += -I$(LIBLIVEUPDATE_SRCDIR)/include
> +
> +$(LIBLIVEUPDATE_O): $(LIBLIVEUPDATE_OUTPUT)/%.o : $(LIBLIVEUPDATE_SRCDIR)/%.c
> +	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> +
> +EXTRA_CLEAN += $(LIBLIVEUPDATE_OUTPUT)
[...]

-- 
Regards,
Pratyush Yadav
