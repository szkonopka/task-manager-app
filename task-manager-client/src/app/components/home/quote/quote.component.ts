import { Component, OnInit } from '@angular/core';
import { Quote } from '@angular/compiler';
import { QuoteService } from '../../../services/quote.service';

@Component({
  selector: 'app-quote',
  templateUrl: './quote.component.html',
  styleUrls: ['./quote.component.sass']
})
export class QuoteComponent implements OnInit {
  quote: Quote;

  constructor(private quoteService: QuoteService) { }

  ngOnInit() {
    this.loadQuote();
  }

  loadQuote() {
    this.quoteService.getRandom().subscribe(quote => { this.quote = quote } );
  }

}
