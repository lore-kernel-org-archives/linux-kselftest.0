Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFC449988;
	Mon, 12 Oct 2026 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795842; cv=none; b=YfzcQ5aDgGA4PerKM1puNzPFPMpudKk88V3FT1s+rxuiV0UfQ0HiKss5PDiUn4ZQIveMan1efemxAjmxsLx61yJyEY0MpJeSJEK6lf2r97yqOKFC+Td788TMRjtVJEtZMgvbyG40I2fnE5JBfM3W1hld+9Dg0RCS0q+vJkaKDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795842; c=relaxed/simple;
	bh=TEvgbz6xc3bVn27NE4ZkLWXS3RI8C+n7+ZHHt7fzj3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbgMfYtR8dUShBhSeo+UcKwpC38GsgnyYuH3srpHBpmpW/UQ50uzrkOJ7+IEKVl2NBijdxlE+pXaIk3wHD5lwmAf2FfZaSAMBiNDplnZFoWcMHr2HyySp4E6XEmlMcjDNDGqubXABGERJlsBJxr7Q+BGaBqufSL9iKNZJcaoD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyxoF0N4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyxoF0N4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358B01F0089B;
	Mon, 12 Oct 2026 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795841;
	bh=4tWDLuqe5/j9UzXGW/UBDTqVzuJKGCKePiwUYO5Ajv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nyxoF0N4/QJOeqcU9DsMLkgw9AeQnSK06fm1Zu8mL/7dMEeirIScrtpSeR2M6nkko
	 5TuPph8WyFExIs0lbEs/dDbEJ5GA3Gs4iWrJ09UAPKKI0t8jzheeRDfF2ijTLQSFe3
	 37wk9WLjXSk71QIdOyIpe4ZgY3U13IwZEVxZgjfpQKAqm+Fwk5qYNziBo4ENTqtZGc
	 bXqtrW4oOmcoqJw2hfG+h0QDNXb1cGDF4GEJj+t0ZZQtnftSjTmVrL9aviiNWy4KJB
	 9zf45zynDnCvgcuvo7LOA1vKa6rGCtgEyW+yMSzYANThJBHZNJ5RhsSS6R8GB5MP1o
	 7gI6dDbeFonxQ==
From: Christian Brauner <brauner@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Natasha Klaus <natalie.klaus@runtimeverification.com>,
	Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/2] userns: reject out-of-range uid_map/gid_map values
Date: Mon, 12 Oct 2026 11:02:05 +0200
Message-ID: <20261012-molch-teigtaschen-kennt-af50b0539cdc@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
References: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=brauner@kernel.org; h=from:subject:message-id; bh=TEvgbz6xc3bVn27NE4ZkLWXS3RI8C+n7+ZHHt7fzj3o=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSdWSSQHdQS+1pYeOHOTuWMx9a8c3fHRIdO/JOQefLJn WdF9jf4OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYifJ3hv99dlst/z5vo1H29 OHHe5Y74R67z4hq8X++eu5tLznDLpFsM/8OmvEnxcjn6f6vjQXXRat9Arp8LLpduDP2vVp2VmFN 3hgcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 14:28:52 +0300, Natasha Klaus wrote:
> map_write() silently truncates uid_map/gid_map/projid_map values above
> U32_MAX modulo 2^32 on 64-bit kernels, so e.g. "4294967301 1000 1" is
> installed as "5 1000 1" without an error. Patch 1 parses each field
> with kstrtou32() so such values fail with -EINVAL. Patch 2 adds
> selftests for out-of-range and negative values in each field and for
> the unchanged in-range path.
> 
> [...]

Applied to the namespace-7.4.misc branch of the vfs/vfs.git tree.
Patches in the namespace-7.4.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: namespace-7.4.misc

[1/2] userns: reject uid_map/gid_map values that do not fit in u32
      https://git.kernel.org/vfs/vfs/c/09a71b58a25d
[2/2] selftests/namespaces: add uid_map/gid_map range tests
      https://git.kernel.org/vfs/vfs/c/8b7b7739ea6a
