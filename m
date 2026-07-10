Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928683E0255;
	Fri, 10 Jul 2026 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670894; cv=none; b=BB3EpLAewefj+jNvKJtI52Ohcti+MfRXzgZTNnd9uwokbSXBptJOd7jeNwjk2oCdHawS1jCwCEPwnARecEBkdhAoSXV0B6LTks8rs8AaFSFoERXUxcRqJaa72oQuyk9ktIMhIVACW+ZmaY2ZqS736S5Hf1tQg1QEVBevVm4RwsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670894; c=relaxed/simple;
	bh=45ANQ3Vsy+d3pK3uw4SKVkvifHlIRlVJm9qalhetqcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uegQRgzLDWMT5hvbSqnLED3SQUM6+Zls1IZKSaemN6m2wdRFPtLQce9i0wrS2XuzdfiQ2K15bGLDyXiZCp4MKeKTzeaXZHbVl3f4P6WIWqA5NIVl/cYHHpZxgbFu5+O5L0Gt4Wf7MAvgc7sfqP9iwuIs1cm9AZakKytP3tI98cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhTkA77o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhTkA77o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DAE1F000E9;
	Fri, 10 Jul 2026 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783670893;
	bh=neUUMderc8pK3/GUtT7QKblcYRV+0mOiXacxP6rJpzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EhTkA77ocVxsAwxNyvNg6nf7rP4PKUWF8V2L6ucOfkTTEsnQ2ehMAbqkm45XNNyam
	 GCO8ZuLKZp7lQ18Xsn7iax43NCh7dzlRm5HdVzz6vV82TidJYJ1ALkn7yWZFqx1RFo
	 41oGuo1zr1oa+sub9rVE199yzEDdfuAgvULv15L17btyB8PiILyNu8S8mcjUfxvI60
	 R+6vEfbtrsmA6xQidW1Z+VbaS/CrDE8wbg7SbrY/piKRC1GDWGpEVp/MXhSDBaCX/S
	 ZZZXs/TO3YWAhCRANnBkGViJE+JNoz+ETrW6i2+4qEbqX0d2pZcUfy9wnB0DYA8v5l
	 MHDqsFoAUJCDQ==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>
Cc: Jordan Richards <jordanrichards@google.com>, 
 Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20260626-luo-vmtest-v0-v4-1-e7d3111cd5b3@kernel.org>
References: <20260626-luo-vmtest-v0-v4-1-e7d3111cd5b3@kernel.org>
Subject: Re: [PATCH v4] selftests/liveupdate: add end to end test
 infrastructure and scripts
Message-Id: <178367088448.4074012.5903750066567618189.b4-ty@b4>
Date: Fri, 10 Jul 2026 11:08:04 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Fri, 26 Jun 2026 12:15:36 +0300, Mike Rapoport wrote:
> selftests/liveupdate: add end to end test infrastructure and scripts

Applied to misc branch of liveupdate/linux.git tree, thanks!

[1/1] selftests/liveupdate: add end to end test infrastructure and scripts
      commit: 89dd1421c554515e0f562ec67d976e6309f2710b

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: misc

--
Sincerely yours,
Mike.


