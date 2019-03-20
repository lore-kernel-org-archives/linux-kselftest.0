From: akpm@linux-foundation.org (Andrew Morton)
Date: Wed, 20 Mar 2019 11:31:11 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <20190320163116.39275-1-joel@joelfernandes.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
Message-ID: <20190320113111.d68a7c71c2c163bbc7d5f6aa@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320183111.u5OB1xRv2Qic__I_7GUPuSn3ploNTHkxYx5FQorXpVA@z>

On Wed, 20 Mar 2019 12:31:14 -0400 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:

> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.tar.xz file).

Lazyass here hasn't been following the recent review discussion and is
going to try cheating.  Are there significant outstanding concerns now,
or are we good to go?
