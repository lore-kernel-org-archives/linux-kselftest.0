From: oleg@redhat.com (Oleg Nesterov)
Date: Thu, 23 May 2019 18:21:04 +0200
Subject: [PATCH v1 1/2] open: add close_range()
In-Reply-To: <20190523142826.omb7vgygudifmveq@brauner.io>
References: <20190522155259.11174-1-christian@brauner.io>
 <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
 <20190523141447.34s3kc3fuwmoeq7n@brauner.io>
 <20190523142826.omb7vgygudifmveq@brauner.io>
Message-ID: <20190523162104.GD23070@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523162104.RW0rUXG9fMjY8b7QzT9T8dHl516-dhv5ukm3acSBnaU@z>

On 05/23, Christian Brauner wrote:
>
> So given that we would really need another find_next_open_fd() I think
> sticking to the simple cond_resched() version I sent before is better
> for now until we see real-world performance issues.

OK, agreed.

Oleg.
