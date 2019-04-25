From: dancol@google.com (Daniel Colascione)
Date: Thu, 25 Apr 2019 15:07:48 -0700
Subject: [PATCH v1 2/2] Add selftests for pidfd polling
In-Reply-To: <20190425212917.yotnir4uqgpnh764@brauner.io>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425190010.46489-2-joel@joelfernandes.org>
 <20190425212917.yotnir4uqgpnh764@brauner.io>
Message-ID:
 <CAKOZueuPeqnWVCv8NnQNyStWBQLybkr2qqtfQ0MjzsfSQDymzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190425220748.mK4XR-GFtVGH7JnG7uEXnXLN1yqoIxV47ECsVIjnxvM@z>

On Thu, Apr 25, 2019@2:29 PM Christian Brauner <christian@brauner.io> wrote:
> This timing-based testing seems kinda odd to be honest. Can't we do
> something better than this?

Agreed. Timing-based tests have a substantial risk of becoming flaky.
We ought to be able to make these tests fully deterministic and not
subject to breakage from odd scheduling outcomes. We don't have
sleepable events for everything, granted, but sleep-waiting on a
condition with exponential backoff is fine in test code. In general,
if you start with a robust test, you can insert a sleep(100) anywhere
and not break the logic. Violating this rule always causes pain sooner
or later.

Other thoughts: IMHO, using poll(2) instead of epoll would simplify
the test code, and I think we can get away with calling
pthread_exit(3) instead of SYS_exit.
